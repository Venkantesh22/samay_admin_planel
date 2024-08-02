import 'package:flutter/material.dart';

class GlobalVariable {
  static TimeOfDay OpenTime = TimeOfDay(hour: 6, minute: 0);
  static TimeOfDay CloseTime = TimeOfDay(hour: 21, minute: 0);
  static TimeOfDay openTimeGlo = TimeOfDay(hour: 6, minute: 0);
  static TimeOfDay closerTimeGlo = TimeOfDay(hour: 6, minute: 0);
  static String salonID = '';

  static const String salon = "Salon";
}
// class GlobalVariable {
//   static TimeOfDay OpenTime = TimeOfDay(hour: 6, minute: 0);
//   static TimeOfDay CloseTime = TimeOfDay(hour: 21, minute: 0);
//   static String openTimeGlo = '';
//   static String closerTimeGlo = '';
//   static String salonID = '';

//   static const String salon = "Salon";
// }
