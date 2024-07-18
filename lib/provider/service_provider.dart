import 'package:flutter/material.dart';
import 'package:samay_admin_plan/features/services_page/screen/services_list.dart';

class ServiceProvider extends ChangeNotifier {
  String _selectedCategory = 'Haircut';
  Widget _currentPage = const ServicesList(categoryName: "Haircut");

  String get selectedCategory => _selectedCategory;
  Widget get currentPage => _currentPage;

  void setCategory(String category) {
    _selectedCategory = category;
    if (category == 'Haircut') {
      _currentPage = const ServicesList(categoryName: "Haircut");
    } else if (category == 'Body Wax') {
      _currentPage = const ServicesList(categoryName: 'Body Wax');
    }
    notifyListeners();
  }
}
