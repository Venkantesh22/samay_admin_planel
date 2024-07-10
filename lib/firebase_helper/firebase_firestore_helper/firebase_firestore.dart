// !create a function in firebase_helper
//first upload image then information
// ! call that function in provider
// ! call Provide in screen

// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_storage_helper/firebase_storage_helper.dart';
import 'package:samay_admin_plan/models/salon_form_models/admin_models.dart';
import 'package:samay_admin_plan/models/salon_infor_model.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Get Admin information
  // Future<AdminModel?> getAdminInformation() async {
  //   try {
  //     String? uid = FirebaseAuth.instance.currentUser?.uid;
  //     if (uid == null) {
  //       throw Exception("User not authenticated");
  //     }

  //     DocumentSnapshot<Map<String, dynamic>> querySnapshot =
  //         await _firebaseFirestore.collection("admins").doc(uid).get();

  //     if (!querySnapshot.exists) {
  //       throw Exception("Admin document does not exist");
  //     }

  //     return AdminModel.fromJson(querySnapshot.data()!);
  //   } catch (e) {
  //     print("Error getting admin information: $e");
  //     return null; // or handle error as appropriate for your app flow
  //   }
  // }

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
          .collection("Salon")
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

      return addSalon;
    } catch (e) {
      showMessage(e.toString());
      rethrow; // Ensure the error is still thrown
    }
  }
// Add Salon weekday Time Information under Admin
  // Future<SalonModel> addWeekDayTime(
  //    String monday,
  // String tuesday,
  // String wednesday,
  // String thursday,
  // String friday,
  // String saturday,
  // String sunday,
  //     BuildContext context) async {
  //   try {
  //     String? adminUid = FirebaseAuth.instance.currentUser?.uid;

  //     DocumentReference reference = _firebaseFirestore
  //         .collection("Salon")
  //         .doc(adminUid) //! First fatch salon date so that you can get Salon id
  //         .collection("WeekDayTime")
  //         .doc();

  //     SalonModel addSalon = SalonModel(
  //       id: reference.id,
  //       description: description,
  //       name: salonName,
  //       email: email,
  //       number: int.parse(mobile),
  //       whatApp: int.parse(whatApp),
  //       salonType: salonType,
  //       openTime: openTime,
  //       closeTime: closeTime,
  //       address: address,
  //       instagram: instagram,
  //       facebook: facebook,
  //       googleMap: googleMap,
  //       linked: linked,
  //     );
  //     await FirebaseStorageHelper.instance
  //         .uploadImageToStorageSalon(addSalon, image);

  //     await reference.set(addSalon.toJson());

  //     return addSalon;
  //   } catch (e) {
  //     showMessage(e.toString());
  //     rethrow; // Ensure the error is still thrown
  //   }
  // }
}
