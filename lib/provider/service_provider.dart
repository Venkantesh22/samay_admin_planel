import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:samay_admin_plan/models/category%20model/category_model.dart';
import 'package:samay_admin_plan/models/service%20model/service_model.dart';

class ServiceProvider extends ChangeNotifier {
  List<CategoryModel> _categoryList = [];
  List<ServiceModel> _servicesList = [];
  CategoryModel? _selectedCategory;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // ServiceModel? _serviceModel;
  // ServiceModel get getSingleServicesInformation => _serviceModel!;

//Function to fatch CategoryList
  Future<void> getCategoryListPro(String salonId) async {
    _categoryList =
        await FirebaseFirestoreHelper.instance.getCategoryListFirebase(salonId);
    notifyListeners();
  }

  //Function to fatch CategoryList
  // Stream<List<CategoryModel>> getCategoryListFirebase(String salonId) {
  //   // QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //   return FirebaseFirestore.instance
  //       .collection("admins")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection('salon')
  //       .doc(salonId)
  //       .collection("category")
  //       .snapshots()
  //       .map((snapshots) => snapshots.docs
  //           .map((doc) => CategoryModel.fromMap(doc.data()))
  //           .toList());
  // }

  //Function to fatch services
  Stream<List<ServiceModel>> getServicesListFirebase(
    String salonId,
    String categoryId,
  ) {
    return FirebaseFirestore.instance
        .collection("admins")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('salon')
        .doc(salonId)
        .collection("category")
        .doc(categoryId)
        .collection("service")
        .snapshots()
        .map((snapshots) => snapshots.docs
            .map((doc) => ServiceModel.fromJson(doc.data()))
            .toList());
  }

  // Create Default categories.
  Future<CategoryModel?> initializeCategory(
    String categoryName,
    String salonId,
    BuildContext context,
  ) async {
    return await FirebaseFirestoreHelper.instance
        .initializeCategoryCollection(categoryName, salonId, context);
  }

//Function to create new category to List
  Future<CategoryModel?> addNewCategoryPro(
    String adminId,
    String salonId,
    String categoryName,
    BuildContext context,
  ) async {
    return await FirebaseFirestoreHelper.instance
        .addNewCategoryFirebase(adminId, categoryName, salonId, context);
  }

  // Add new services .
  Future<ServiceModel?> addServicePro(
    String adminId,
    String salonId,
    String categoryId,
    String servicesName,
    double price,
    double hours,
    double min,
    String description,
  ) async {
    return await FirebaseFirestoreHelper.instance.addServiceFirebase(
      adminId,
      salonId,
      categoryId,
      servicesName,
      price,
      hours,
      min,
      description,
    );
  }

  // Future<void> getSingleServiceInfoFirebase() async {
  //   _salonModel = await FirebaseFirestoreHelper.instance.getSingleServicesInformation();
  //   notifyListeners();
  // }

  // Future<void> callBackFunction(String salonId) async {
  //   getCategoryListFirebase(salonId);
  //   notifyListeners();
  // }
  Future<void> callBackFunction(String salonId) async {
    await getCategoryListPro(salonId);
    notifyListeners();
  }

  void selectCategory(CategoryModel category) {
    _selectedCategory = category;
    notifyListeners();
  }

  List<CategoryModel> get getCategoryList => _categoryList;
  List<ServiceModel> get getserviceList => _servicesList;
  CategoryModel? get selectedCategory => _selectedCategory;
}
