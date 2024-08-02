// !create a function in firebase_helper
//first upload image then information
// ! call that function in provider
// ! call Provide in screen

// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/constants/global_variable.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_storage_helper/firebase_storage_helper.dart';
import 'package:samay_admin_plan/models/category_model/category_model.dart';
import 'package:samay_admin_plan/models/salon_form_models/salon_infor_model.dart';
import 'package:samay_admin_plan/models/service_model/service_model.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      String city,
      String state,
      String pinCode,
      TimeOfDay openTime,
      TimeOfDay closeTime,
      String instagram,
      String facebook,
      String googleMap,
      String linked,
      BuildContext context) async {
    try {
      String? adminUid = _auth.currentUser?.uid;

      DocumentReference reference = _firebaseFirestore
          .collection("admins")
          .doc(adminUid)
          .collection("salon")
          .doc();

      SalonModel salonModel = SalonModel(
        id: reference.id,
        adminId: adminUid!,
        description: description,
        name: salonName,
        email: email,
        number: int.parse(mobile),
        whatApp: int.parse(whatApp),
        salonType: salonType,
        openTime: openTime,
        closeTime: closeTime,
        address: address,
        city: city,
        state: state,
        pinCode: pinCode,
        instagram: instagram,
        facebook: facebook,
        googleMap: googleMap,
        linked: linked,
        monday: '',
        tuesday: '',
        wednesday: '',
        thursday: '',
        friday: '',
        saturday: '',
        sunday: '',
      );
      // upload image of create new folder then upload

      String? uploadImageUrl = await FirebaseStorageHelper.instance
          .uploadSalonImageToStorage(
              salonModel.id,
              "${GlobalVariable.salon}${salonModel.name}${salonModel.id}images",
              image);
      salonModel.image = uploadImageUrl;

      await reference.set(salonModel.toJson());
      // GlobalVariable.salonID = reference.id;
      // print("Print ID ${reference.id}");
      // print("Print ID ${GlobalVariable.salonID}");

      return salonModel;
    } catch (e) {
      showMessage(e.toString());
      rethrow; // Ensure the error is still thrown
    }
  }

  // initializeCategoryCollection a Category
  Future<CategoryModel> initializeCategoryCollection(
    String categoryName,
    String salonId,
    BuildContext context,
  ) async {
    try {
      String? adminUid = FirebaseAuth.instance.currentUser?.uid;

      DocumentReference reference = _firebaseFirestore
          .collection("admins")
          .doc(adminUid)
          .collection("salon")
          .doc(salonId)
          .collection("category")
          .doc();

      CategoryModel categoryModel = CategoryModel(
        id: reference.id,
        categoryName: categoryName,
        salonId: salonId,
      );

      await reference.set(categoryModel.toJson());
      return categoryModel;
    } catch (e) {
      showMessage("Error create Category ${e.toString()}");
      rethrow; // Ensure the error is still thrown
    }
  }

// Add new Category
  Future<CategoryModel> addNewCategoryFirebase(
    String adminId,
    String categoryName,
    String salonId,
    BuildContext context,
  ) async {
    try {
      DocumentReference reference = _firebaseFirestore
          .collection("admins")
          .doc(adminId)
          .collection("salon")
          .doc(salonId)
          .collection("category")
          .doc();

      CategoryModel categoryModel = CategoryModel(
        id: reference.id,
        categoryName: categoryName,
        salonId: salonId,
      );

      await reference.set(categoryModel.toJson());
      return categoryModel;
    } catch (e) {
      rethrow; // Ensure the error is still thrown
    }
  }

  //Update a Category
  Future<void> updateSingleCategoryFirebase(CategoryModel categoryModel) async {
    try {
      String? adminUid = FirebaseAuth.instance.currentUser?.uid;
      await _firebaseFirestore
          .collection("admins")
          .doc(adminUid)
          .collection("salon")
          .doc(categoryModel.salonId)
          .collection("category")
          .doc(categoryModel.id)
          .update(categoryModel.toJson());
    } catch (e) {}
  }

//Delete Single Category
  Future<bool> deleteSingleCategoryFb(CategoryModel categoryModel) async {
    try {
      String? adminUid = FirebaseAuth.instance.currentUser?.uid;
      await _firebaseFirestore
          .collection("admins")
          .doc(adminUid)
          .collection("salon")
          .doc(categoryModel.salonId)
          .collection("category")
          .doc(categoryModel.id)
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Add Service to firebase Information under Admin/salon/category/services
  Future<ServiceModel> addServiceFirebase(
    String adminId,
    String salonId,
    String categoryId,
    String servicesName,
    double price,
    double hours,
    double min,
    String description,
  ) async {
    DocumentReference reference = _firebaseFirestore
        .collection("admins")
        .doc(adminId)
        .collection("salon")
        .doc(salonId)
        .collection("category")
        .doc(categoryId)
        .collection("service")
        .doc();

    ServiceModel addserviceModel = ServiceModel(
      salonId: salonId,
      categoryId: categoryId,
      id: reference.id,
      servicesName: servicesName,
      price: price,
      hours: hours,
      minutes: min,
      description: description,
    );

    await reference.set(addserviceModel.toJson());
    return addserviceModel;
  }

//Update Single Service for firebase
  Future<void> updateSingleServiceFirebae(ServiceModel serviceModel) async {
    String? adminUid = FirebaseAuth.instance.currentUser?.uid;

    await _firebaseFirestore
        .collection("admins")
        .doc(adminUid)
        .collection("salon")
        .doc(serviceModel.salonId)
        .collection("category")
        .doc(serviceModel.categoryId)
        .collection("service")
        .doc(serviceModel.id)
        .update(serviceModel.toJson());
  }

//Delete Single Service for firebase
  Future<bool> deleteServiceFirebase(ServiceModel serviceModel) async {
    try {
      String? adminUid = FirebaseAuth.instance.currentUser?.uid;

      await _firebaseFirestore
          .collection("admins")
          .doc(adminUid)
          .collection("salon")
          .doc(serviceModel.salonId)
          .collection("category")
          .doc(serviceModel.categoryId)
          .collection("service")
          .doc(serviceModel.id)
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }

// Get Admin information
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
      showMessage('Error fetching admin info: ${e.toString()}');
      print('Error fetching admin info: $e');
    }
    return null;
  }

// Get salon information
  Future<SalonModel?> getSalonInformation() async {
    try {
      CollectionReference salonCollection = await _firebaseFirestore
          .collection("admins")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('salon');
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
//! Get Single Service information
  // Future<SalonModel?> getSingleServiceInformation() async {
  //   try {
  //     CollectionReference serviceCollection = await _firebaseFirestore
  //         .collection("admins")
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .collection('salon');
  //         .doc()
  //     // if (snapshot.docs.isNotEmpty) {
  //     //   DocumentSnapshot doc = snapshot.docs.first;
  //     //   return SalonModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  //     // }
  //   } catch (e) {
  //     showMessage('Error fetching salon: $e');
  //   }
  //   return null;
  // }

// Get category List
  Future<List<CategoryModel>> getCategoryListFirebase(String salonId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore
              .collection("admins")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('salon')
              .doc(salonId)
              .collection("category")
              .get();
      List<CategoryModel> categoryList = querySnapshot.docs
          .map((e) => CategoryModel.fromMap(e.data()))
          .toList();
      return categoryList;
    } catch (e) {
      print("Error while get category List ${e.toString()}");
      rethrow;
    }
  }
}
