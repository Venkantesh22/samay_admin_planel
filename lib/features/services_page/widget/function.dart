import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';
import 'package:samay_admin_plan/provider/service_provider.dart';

class catFunction {
  static catFunction instance = catFunction();

  void cateDef(ServiceProvider serviceProvider, AppProvider appProvider,
      BuildContext context) {
    serviceProvider.initializeCategory(
        "HireCut", appProvider.getSalonInformation.id, context);
    serviceProvider.initializeCategory(
        "HireColor", appProvider.getSalonInformation.id, context);
    serviceProvider.initializeCategory(
        "Dtime", appProvider.getSalonInformation.id, context);
  }
}
