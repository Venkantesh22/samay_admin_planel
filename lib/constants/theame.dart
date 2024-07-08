import 'package:flutter/material.dart';
import 'package:samay_admin_plan/utility/color.dart';

ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.mainColor),
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    ),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    ),
  ),
);
