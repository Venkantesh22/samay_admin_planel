// ignore_for_file: use_build_context_synchronously

import 'package:universal_io/io.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_storage_helper/firebase_storage_helper.dart';
import 'package:samay_admin_plan/models/admin_models.dart';

class AppProvider with ChangeNotifier {
  AdminModel? _adminModel;

  AdminModel get getAdminInformation => _adminModel!;

  void getAdminInfoFirebase() async {
    try {
      _adminModel =
          await FirebaseFirestoreHelper.instance.getAdminInformation();
      notifyListeners();
    } catch (e) {
      print('Error fetching admin info: $e');
    }
  }

  //------- Admin Information

  // void updateUserInfoFirebase(
  //     BuildContext context, AdminModel adminModel, File? file) async {
  //   if (file == null) {
  //     showLoaderDialog(context);

  //     _adminModel = adminModel;
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(_adminModel!.id)
  //         .set(_adminModel!.toJson());
  //     Navigator.of(context, rootNavigator: true).pop();
  //     Navigator.of(context).pop();
  //   } else {
  //     showLoaderDialog(context);

  //     String imageUrl =
  //         await FirebaseStorageHelper.instance.uploadUserImage(file);
  //     _adminModel = adminModel.copyWith(image: imageUrl);
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(_adminModel!.id)
  //         .set(_adminModel!.toJson());
  //     Navigator.of(context, rootNavigator: true).pop();
  //     Navigator.of(context).pop();
  //   }
  //   showMessage("Successfully updated profile");

  //   notifyListeners();
  // }
}
