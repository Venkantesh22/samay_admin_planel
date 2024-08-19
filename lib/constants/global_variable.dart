import 'package:flutter/material.dart';

class GlobalVariable {
  static TimeOfDay OpenTime = TimeOfDay(hour: 6, minute: 0);
  static TimeOfDay CloseTime = TimeOfDay(hour: 21, minute: 0);
  static TimeOfDay openTimeGlo = TimeOfDay(hour: 6, minute: 0);
  static TimeOfDay closerTimeGlo = TimeOfDay(hour: 6, minute: 0);
  static String salonID = '';

  static const String salon = "Salon";

// variable for increment appointment no.
  static String samayCollectionId = '6fa4GusAyAIkcAuBkYlu';
  static String salonCollectionId = 'j5bzQoxDswYJdSLQI3Lw';
  static num appointmentNO = 0.0;
}
