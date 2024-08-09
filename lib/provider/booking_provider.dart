// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:samay_admin_plan/firebase_helper/firebase_firestore_helper/user_order_fb.dart';
// import 'package:samay_admin_plan/models/user_order/user_order_model.dart';

// class BookingProvider with ChangeNotifier {
//   final UserBookingFB _userBookingFB = UserBookingFB.instance;

//   List<OrderModel> _bookinglist = [];
//   List<OrderModel> get getBookingList => _bookinglist;

//   // get date for Booking list for firebase
//   Future<void> getBookingListPro(String selectDate) async {
//     DateTime _date =
//         DateTime.parse(selectDate); // Parse the string to a DateTime object
//     String _formattedDate = DateFormat('dd/MM/yyyy')
//         .format(_date); // Format the DateTime object to a string
//     _bookinglist = await _userBookingFB.getUserBookingListFB(_formattedDate);
//     print(_formattedDate);
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_firestore_helper/user_order_fb.dart';
import 'package:samay_admin_plan/models/user_order/user_order_model.dart';

class BookingProvider with ChangeNotifier {
  final UserBookingFB _userBookingFB = UserBookingFB.instance;

  List<OrderModel> _bookinglist = [];
  List<OrderModel> get getBookingList => _bookinglist;

  // Get booking list for a specific date from Firebase
  Future<void> getBookingListPro(DateTime date) async {
    String _formattedDate =
        DateFormat('dd/MM/yyyy').format(date); // Format date correctly
    _bookinglist = await _userBookingFB.getUserBookingListFB(_formattedDate);
    print("Fetched data for date: $_formattedDate");
    notifyListeners();
  }
}
