import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  // Function to get current date and time in a formatted string
  static String getCurrentDate() {
    DateTime now = DateTime.now();
    return DateFormat('EEE MMM yyyy').format(now);
  }

  static String getCurrentTime() {
    DateTime now = DateTime.now();
    return DateFormat('hh:mm a').format(now); // HH:mm a (e.g. 03:45 PM)
  }
}
