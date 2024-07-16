// !create a function in firebase_helper
//first upload image then information
// ! call that function in provider
// ! call Provide in screen

// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/constants/global_variable.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_storage_helper/firebase_storage_helper.dart';
import 'package:samay_admin_plan/models/admin_models.dart';

import 'package:samay_admin_plan/models/salon_form_models/salon_infor_model.dart';
import 'package:samay_admin_plan/models/salon_form_models/weekday_model.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

// Add Salon Information under Admin
  Future<SalonModel> addSalon(
      Uint8List image,
      String salonName,
      String email,
      String mobile,
      String whatApp,
      String salonType,
      String description,
      String address,
      String openTime,
      String closeTime,
      String instagram,
      String facebook,
      String googleMap,
      String linked,
      BuildContext context) async {
    try {
      String? adminUid = FirebaseAuth.instance.currentUser?.uid;

      DocumentReference reference = _firebaseFirestore
          .collection("admins")
          .doc(adminUid)
          .collection("salon")
          .doc();

      SalonModel addSalon = SalonModel(
        id: reference.id,
        description: description,
        name: salonName,
        email: email,
        number: int.parse(mobile),
        whatApp: int.parse(whatApp),
        salonType: salonType,
        openTime: openTime,
        closeTime: closeTime,
        address: address,
        instagram: instagram,
        facebook: facebook,
        googleMap: googleMap,
        linked: linked,
      );
      await FirebaseStorageHelper.instance
          .uploadImageToStorageSalon(addSalon, image);

      await reference.set(addSalon.toJson());
      // GlobalVariable.salonID = reference.id;
      // print("Print ID ${reference.id}");
      // print("Print ID ${GlobalVariable.salonID}");

      return addSalon;
    } catch (e) {
      showMessage(e.toString());
      rethrow; // Ensure the error is still thrown
    }
  }

  Future<Map<String, dynamic>?> getAdminInformation() async {
    try {
      DocumentSnapshot doc = await _firebaseFirestore
          .collection('admins')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>?;
      }
    } catch (e) {
      print('Error fetching admin info: $e');
    }
    return null;
  }

  Future<SalonModel?> getSalonInformation() async {
    try {
      CollectionReference salonCollection = await _firebaseFirestore
          .collection("admins")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Salon');
      QuerySnapshot snapshot = await salonCollection.limit(1).get();
      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot doc = snapshot.docs.first;
        return SalonModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      }
    } catch (e) {
      showMessage('Error fetching salon: $e');
    }
    return null;
  }

// Add Salon weekday Time Information under Admin
  Future<WeekdayModel> addWeekDay(
      String salonID,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday,
      String sunday,
      BuildContext context) async {
    try {
      String? _adminUid = FirebaseAuth.instance.currentUser?.uid;
      DocumentReference reference = _firebaseFirestore
          .collection("admins")
          .doc(_adminUid)
          .collection("Salon")
          .doc(salonID) //! First fatch salon date so that you can get Salon id
          .collection("WeekDayTime")
          .doc();

      WeekdayModel addweekday = WeekdayModel(
          id: reference.id,
          monday: monday,
          tuesday: tuesday,
          wednesday: wednesday,
          thursday: thursday,
          friday: friday,
          saturday: saturday,
          sunday: sunday);

      await reference.set(addweekday.toJson());

      return addweekday;
    } catch (e) {
      showMessage(e.toString());
      rethrow; // Ensure the error is still thrown
    }
  }
}
