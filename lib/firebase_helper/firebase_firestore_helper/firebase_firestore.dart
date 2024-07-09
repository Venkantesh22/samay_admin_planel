// !create a function in firebase_helper
//first upload image then information
// ! call that function in provider
// ! call Provide in screen

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_storage_helper/firebase_storage_helper.dart';
import 'package:samay_admin_plan/models/admin_models.dart';
import 'package:samay_admin_plan/models/salon_infor_model.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Get Admin information
  Future<AdminModel?> getAdminInformation() async {
    try {
      String? uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        throw Exception("User not authenticated");
      }

      DocumentSnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("admins").doc(uid).get();

      if (!querySnapshot.exists) {
        throw Exception("Admin document does not exist");
      }

      return AdminModel.fromJson(querySnapshot.data()!);
    } catch (e) {
      print("Error getting admin information: $e");
      return null; // or handle error as appropriate for your app flow
    }
  }

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
    showLoaderDialog(context);

    try {
      String adminId = 'adminId';
      DocumentReference reference = _firebaseFirestore
          .collection("admins")
          .doc(adminId)
          .collection("Salons")
          .doc();

      SalonModel addSalon = SalonModel(
        id: reference.id,
        name: salonName,
        email: email,
        number: int.parse(mobile),
        whatApp: int.parse(whatApp),
        salonType: salonType,
        description: description,
        openTime: openTime,
        closeTime: closeTime,
        address: address,
        instagram: instagram,
        facebook: facebook,
        googleMap: googleMap,
        linked: linked,
      );

      String? imageUri = await FirebaseStorageHelper.instance
          .uploadImageToStorageSalon(addSalon, image);
      addSalon.image = imageUri;

      await reference.set(addSalon.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      return addSalon;
    } catch (e) {
      Navigator.pop(context); // Close the loading dialog
      _showErrorDialog(context, e.toString());
      rethrow; // Ensure the error is still thrown
      rethrow; // Ensure the error is still thrown
    }
  }

  // Function to show the loading dialog
  void showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          Container(
            margin: EdgeInsets.only(left: 7),
            child: Text("Loading..."),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

// Function to show the error dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Future<SalonModel> addSalon(
  //     Uint8List image,
  //     String salonName,
  //     String email,
  //     String mobile,
  //     String whatApp,
  //     String salonType,
  //     String description,
  //     String address,
  //     String openTime,
  //     String closeTime,
  //     String instagram,
  //     String facebook,
  //     String googleMap,
  //     String linked,
  //     BuildContext context) async {

  //   showLoaderDialog(context);

  //   String adminId = 'adminId';
  //   DocumentReference reference = _firebaseFirestore
  //       .collection("admins")
  //       .doc(adminId)
  //       .collection("Salons")
  //       .doc();

  //   SalonModel addSalon = SalonModel(
  //       id: reference.id,
  //       name: salonName,
  //       email: email,
  //       number: int.parse(mobile),
  //       whatApp: int.parse(whatApp),
  //       salonType: salonType,
  //       description: description,
  //       openTime: openTime,
  //       closeTime: closeTime,
  //       address: address);
  //   String? imageUri = await FirebaseStorageHelper.instance
  //       .uploadImageToStorageSalon(addSalon, image);

  //   await reference.set(addSalon.toJson());
  //   return addSalon;
  // }
}
