// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/constants/global_variable.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_storage_helper/firebase_storage_helper.dart';
import 'package:samay_admin_plan/models/admin_models.dart';
import 'package:samay_admin_plan/models/salon_form_models/salon_infor_model.dart';
import 'package:flutter/material.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:samay_admin_plan/models/salon_form_models/weekday_model.dart';

class AppProvider with ChangeNotifier {
  SalonModel? _salonModel;
  SalonModel get getSalonInformation => _salonModel!;

  AdminModel? _adminModel;
  AdminModel get getAdminInformation => _adminModel!;
  // Add a Salon infor to firebase
  void addsalonInfoForm(
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
    SalonModel salonModel = await FirebaseFirestoreHelper.instance.addSalon(
        image,
        salonName,
        email,
        mobile,
        whatApp,
        salonType,
        description,
        address,
        openTime,
        closeTime,
        instagram,
        facebook,
        googleMap,
        linked,
        context);
    GlobalVariable.salonID = salonModel.id;
    notifyListeners();
  }

  Future<void> getSalonInfoFirebase() async {
    _salonModel = await FirebaseFirestoreHelper.instance.getSalonInformation();
    notifyListeners();
  }

  Future<void> getAdminInfoFirebase() async {
    Map<String, dynamic>? adminData =
        await FirebaseFirestoreHelper.instance.getAdminInformation();
    if (adminData != null) {
      _adminModel = AdminModel.fromJson(
        adminData,
      );
      notifyListeners();
    }
  }

  void updateSalonInfoFirebase(BuildContext context, SalonModel salonModel,
      {Uint8List? image}) async {
    if (image == null) {
      showLoaderDialog(context);

      _salonModel = salonModel;
      await FirebaseFirestore.instance
          .collection("admins")
          .doc(_adminModel!.id)
          .collection('Salon')
          .doc(_salonModel!.id)
          .set(_salonModel!.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context).pop();
    } else {
      showLoaderDialog(context);

      String? imageUrl = await FirebaseStorageHelper.instance
          .uploadImageToStorageSalon(_salonModel!, image);
      await FirebaseFirestore.instance
          .collection("admins")
          .doc(_adminModel!.id)
          .collection('Salon')
          .doc(_salonModel!.id)
          .set(_salonModel!.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context).pop();

      showMessage("Successfully updated profile");

      notifyListeners();
    }

//  void updateUserInfoFirebase(
//       BuildContext context, UserModel userModel, File? file) async {
//     if (file == null) {
//       showLoaderDialog(context);

//       _userModel = userModel;
//       await FirebaseFirestore.instance
//           .collection("users")
//           .doc(_userModel!.id)
//           .set(_userModel!.toJson());
//       Navigator.of(context, rootNavigator: true).pop();
//       Navigator.of(context).pop();
//     } else {
//       showLoaderDialog(context);

//       String imageUrl =
//           await FirebaseStorageHelper.instance.uploadUserImage(file);
//       _userModel = userModel.copyWith(image: imageUrl);
//       await FirebaseFirestore.instance
//           .collection("users")
//           .doc(_userModel!.id)
//           .set(_userModel!.toJson());
//       Navigator.of(context, rootNavigator: true).pop();
//       Navigator.of(context).pop();
//     }
//     showMessage("Successfully updated profile");

//     notifyListeners();
//   }

    // Add a Salon weekday  infor to firebase
    void addWeekday(
        String salonID,
        String monday,
        String tuesday,
        String wednesday,
        String thursday,
        String friday,
        String saturday,
        String sunday,
        BuildContext context) async {
      WeekdayModel weekdayModel =
          await FirebaseFirestoreHelper.instance.addWeekDay(
        salonID,
        monday,
        tuesday,
        wednesday,
        thursday,
        friday,
        saturday,
        sunday,
        context,
      );
      notifyListeners();
    }
  }
}
