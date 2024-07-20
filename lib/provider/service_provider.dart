import 'package:flutter/material.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:samay_admin_plan/models/category%20model/category_model.dart';

class ServiceProvider extends ChangeNotifier {
  List<CategoryModel> _categoryList = [];
  CategoryModel? _selectedCategory;

  Future<void> getCategoryListPro(String salonId) async {
    _categoryList =
        await FirebaseFirestoreHelper.instance.getCategoryListFirebase(salonId);
  }

  // Create Default categories.
  Future<CategoryModel?> initializeCategory(
      String categoryName, String salonId, BuildContext context) async {
    return await FirebaseFirestoreHelper.instance
        .initializeCategoryCollection(categoryName, salonId, context);
  }

  Future<void> callBackFunction(String salonId) async {
    await getCategoryListPro(salonId);
  }

  void selectCategory(CategoryModel category) {
    _selectedCategory = category;
    notifyListeners();
  }

  List<CategoryModel> get getCategoryList => _categoryList;
  CategoryModel? get selectedCategory => _selectedCategory;
}
