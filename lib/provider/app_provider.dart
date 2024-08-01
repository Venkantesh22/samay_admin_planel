// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/constants/global_variable.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_storage_helper/firebase_storage_helper.dart';
import 'package:samay_admin_plan/models/admin_models.dart';
import 'package:samay_admin_plan/models/salon_form_models/salon_infor_model.dart';
import 'package:flutter/material.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:samay_admin_plan/models/service_model/service_model.dart';

class AppProvider with ChangeNotifier {
  SalonModel? _salonModel;
  SalonModel get getSalonInformation => _salonModel!;

  AdminModel? _adminModel;
  AdminModel get getAdminInformation => _adminModel!;

  // ServiceModel? _serviceModel;
  // ServiceModel get getServiceInformation => _serviceModel!;

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
      String city,
      String state,
      String pinCode,
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
        city,
        state,
        pinCode,
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

// Fetch a Salon infor
  Future<void> getSalonInfoFirebase() async {
    _salonModel = await FirebaseFirestoreHelper.instance.getSalonInformation();
    notifyListeners();
  }

// Fetch a Admin infor
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

// Update a Salon infor
  void updateSalonInfoFirebase(
    BuildContext context,
    SalonModel salonModel, {
    Uint8List? image,
  }) async {
    if (image == null) {
      showLoaderDialog(context);

      _salonModel = salonModel;
      await FirebaseFirestore.instance
          .collection("admins")
          .doc(_adminModel!.id)
          .collection('salon')
          .doc(_salonModel!.id)
          .set(_salonModel!.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context).pop();
    } else {
      showLoaderDialog(context);
      _salonModel = salonModel;
      String? uploadImageUrl = await FirebaseStorageHelper.instance
          .uploadSalonImageToStorage(
              salonModel.id,
              "${GlobalVariable.salon}${salonModel.name}${salonModel.id}images",
              image);
      salonModel.image = uploadImageUrl;
      await FirebaseFirestore.instance
          .collection("admins")
          .doc(_adminModel!.id)
          .collection('salon')
          .doc(_salonModel!.id)
          .set(_salonModel!.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context).pop();

      showMessage("Successfully updated ${GlobalVariable.salon} profile");
    }
    notifyListeners();
  }
}
