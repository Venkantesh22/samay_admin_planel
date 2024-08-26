import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_admin_plan/constants/global_variable.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';
import 'package:samay_admin_plan/widget/custom_button.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
    webPosition: "center",
    msg: message,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    fontSize: Dimensions.dimenisonNo16,
  );
}

// Function to show a message Delete
void showDeleteAlertDialog(
    BuildContext context, String title, message, VoidCallback ontap) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(
              fontSize: Dimensions.dimenisonNo24, fontWeight: FontWeight.w600),
        ),
        // content:  Text('The salon is closed on the selected date.'),
        content: Text(
          message,
          style: TextStyle(
              fontSize: Dimensions.dimenisonNo16, color: Colors.black),
        ),
        actions: [
          SizedBox(
            height: Dimensions.dimenisonNo20,
          ),
          SizedBox(
            height: Dimensions.dimenisonNo36,
            child: Row(
              children: [
                CustomButtom(
                  buttonColor: Colors.white,
                  text: "No",
                  ontap: () {
                    Navigator.pop(context);
                  },
                  textColor: Colors.black,
                ),
                Spacer(),
                CustomButtom(buttonColor: Colors.red, text: "Yes", ontap: ontap)
              ],
            ),
          )
        ],
      );
    },
  );
}

// Function to show a message
void showInforAlertDialog(
  BuildContext context,
  String title,
  message,
) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(
              fontSize: Dimensions.dimenisonNo24, fontWeight: FontWeight.w600),
        ),
        // content:  Text('The salon is closed on the selected date.'),
        content: Text(
          message,
          style: TextStyle(
              fontSize: Dimensions.dimenisonNo16, color: Colors.black),
        ),
        actions: [
          CustomButtom(
            buttonColor: AppColor.buttonColor,
            text: "OK",
            ontap: () {
              Navigator.pop(context);
            },
            textColor: Colors.white,
          )
        ],
      );
    },
  );
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: AppColor.bgForAdminCreateSec,
    content: Builder(builder: (context) {
      return SizedBox(
        height: Dimensions.dimenisonNo40,
        width: Dimensions.dimenisonNo200,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Dimensions.dimenisonNo20,
            ),
            const CircularProgressIndicator(
              color: Color(0xffe16555),
            ),
            SizedBox(
              width: Dimensions.dimenisonNo18,
            ),
            Container(
                margin: EdgeInsets.only(left: Dimensions.dimenisonNo10),
                child: Text(
                  "Loading...",
                  style: TextStyle(
                      fontSize: Dimensions.dimenisonNo16,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.w500),
                )),
          ],
        ),
      );
    }),
  );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return "Email already used. Go to login page.";
    case "account-exists-with-different-credential":
      return "Email already used. Go to login page.";
    case "email-already-in-use":
      return "Email already used. Go to login page.";
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong Password ";
    case "ERROR_USER_NOT_FOUND":
      return "No user found with this email.";
    case "user-not-found":
      return "No user found with this email.";
    case "ERROR_USER_DISABLED":
      return "User disabled.";
    case "user-disabled":
      return "User disabled.";
    case "ERROR_TOO_MANY_REQUESTS":
      return "Too many requests to log into this account.";
    case "operation-not-allowed":
      return "Too many requests to log into this account.";
    case "ERROR_OPERATION_NOT_ALLOWED":
      return "Too many requests to log into this account.";
    case "ERROR_INVALID_EMAIL":
      return "Email address is invalid.";
    case "invalid-email":
      return "Email address is invalid.";
    default:
      return "Login failed. Please try again.";
  }
}

// Login Text Field Validation.

bool loginVaildation(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    showMessage("Both Fields are empty");
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is Empty");
    return false;
  } else if (password.isEmpty) {
    showMessage("Password is Empty");
    return false;
  } else {
    return true;
  }
}

// SignUp Text Field Validation.
bool signUpVaildation(
    String email, String password, String name, String phone) {
  if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
    showMessage("All Fields are empty");
    return false;
  } else if (name.isEmpty) {
    showMessage("Name is Empty");
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is Empty");
    return false;
  } else if (phone.isEmpty) {
    showMessage("Phone is Empty");
    return false;
  } else if (phone.length != 10) {
    showMessage("Enter 10 digit mobile number.");
    return false;
  } else if (!RegExp(r'^\d+$').hasMatch(phone)) {
    showMessage('Please enter only digits in Mobile');
    return false;
  } else if (password.isEmpty) {
    showMessage("Password is Empty");
    return false;
  } else {
    return true;
  }
}

// Salon form Text Field Validation.
bool formCreateAccountVaildation(
  String salonName,
  String email,
  String mobile,
  String whatApp,
  String salonType,
  String descrition,
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
  Uint8List image,
) {
  if (email.isEmpty &&
      salonName.isEmpty &&
      mobile.isEmpty &&
      whatApp.isEmpty &&
      salonType.isEmpty &&
      descrition.isEmpty &&
      address.isEmpty &&
      openTime.toString().isEmpty &&
      closeTime.toString().isEmpty &&
      instagram.isEmpty &&
      facebook.isEmpty &&
      googleMap.isEmpty &&
      linked.isEmpty) {
    showMessage("All Fields are empty");
    return false;
  } else if (salonName.isEmpty) {
    showMessage("${GlobalVariable.salon} is Empty");
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is Empty");
    return false;
  } else if (image.isEmpty) {
    showMessage("Images is not select");
    return false;
  } else if (mobile.isEmpty) {
    showMessage("Phone is Empty");
    return false;
  } else if (mobile.length != 10) {
    showMessage("Enter 10 digit mobile number.");
    return false;
  } else if (!RegExp(r'^\d+$').hasMatch(mobile)) {
    showMessage('Please enter only digits in Mobile');
    return false;
  } else if (whatApp.isEmpty) {
    showMessage("WhatApp number not is Empty");
    return false;
  } else if (whatApp.length != 10) {
    showMessage("Enter 10 digit mobile number.");
    return false;
  } else if (!RegExp(r'^\d+$').hasMatch(whatApp)) {
    showMessage('Please enter only digits in Mobile');
    return false;
  } else if (salonType.isEmpty) {
    showMessage("Select a type of salon");
    return false;
  } else if (descrition.isEmpty) {
    showMessage("descrition not is Empty");
    return false;
  } else if (address.isEmpty) {
    showMessage("address not is Empty");
    return false;
  } else if (city.isEmpty) {
    showMessage("city not is Empty");
    return false;
  } else if (state.isEmpty) {
    showMessage("city not is Empty");
    return false;
  } else if (pinCode.isEmpty) {
    showMessage("city not is Empty");
    return false;
  } else if (openTime.toString().isEmpty) {
    showMessage("${GlobalVariable.salon} open time is not select");
    return false;
  } else if (openTime.toString().isEmpty) {
    showMessage("${GlobalVariable.salon} closing time is not select");
    return false;
  } else {
    return true;
  }
}

// Salon week day Text Field Validation.
bool formWeekdayVaildation(
  String monday,
  String tuesday,
  String wednesday,
  String thursday,
  String friday,
  String saturday,
  String sunday,
) {
  if (monday.isEmpty &&
      tuesday.isEmpty &&
      wednesday.isEmpty &&
      thursday.isEmpty &&
      friday.isEmpty &&
      saturday.isEmpty &&
      sunday.isEmpty) {
    showMessage("All Fields are empty");
    return false;
  } else if (monday.isEmpty) {
    showMessage("Select a Time on Monday");
    return false;
  } else if (tuesday.isEmpty) {
    showMessage("Select a Time on Tuesday");
    return false;
  } else if (wednesday.isEmpty) {
    showMessage("Select a Time on Wednesday");
    return false;
  } else if (thursday.isEmpty) {
    showMessage("Select a Time on Thursday");
    return false;
  } else if (friday.isEmpty) {
    showMessage("Select a Time on Friday");
    return false;
  } else if (saturday.isEmpty) {
    showMessage("Select a Time on Saturday");
    return false;
  } else if (sunday.isEmpty) {
    showMessage("Select a Time on Sunday");
    return false;
  } else {
    return true;
  }
}

// Add new Category popup Text Field Validation.
bool addNewCategoryVaildation(
  String categoryName,
) {
  if (categoryName.isEmpty) {
    showMessage("Enter a Category Name");
    return false;
  } else {
    return true;
  }
}

// Add new Service popup Text Field Validation.
bool addNewServiceVaildation(
  final String servicesName,
  final String serviceCode,
  final String price,
  final String hours,
  final String minutes,
  final String description,
) {
  final double? min = double.tryParse(minutes);
  final double? hr = double.tryParse(minutes);
  final double? pr = double.tryParse(price);

  if (servicesName.isEmpty &&
      serviceCode.isEmpty &&
      price.isEmpty &&
      hours.isEmpty &&
      minutes.isEmpty &&
      description.isEmpty) {
    showMessage("All Fields are empty");
    return false;
  } else if (servicesName.isEmpty) {
    showMessage("Enter a Service Name");
    return false;
  } else if (serviceCode.isEmpty) {
    showMessage("Enter 4-Digit service code");
    return false;
    // } else if (serviceCode.length <= 4) {
    //   showMessage("Enter 4-Digit service code");
    //   return false;
  } else if (price.isEmpty) {
    showMessage("Enter a Price");
    return false;
  } else if (pr == null || pr < 0) {
    showMessage("Enter a Price");
    return false;
  } else if (hours.isEmpty) {
    showMessage("Enter a Hours");
    return false;
  } else if (hr == null || hr < 0) {
    showMessage("Enter a correct hours.");
    return false;
  } else if (minutes.isEmpty) {
    showMessage("Enter a Minutes");
    return false;
  } else if (min == null || min < 0 || min > 59) {
    showMessage("Enter a correct minute.");
    return false;
  } else if (description.isEmpty) {
    showMessage("Enter a Service description");
    return false;
  } else {
    return true;
  }
}

// Add new Appointment Text Field Validation.
bool addNewAppointmentVaildation(
  final String name,
  final String lastName,
  final String number,
) {
  if (name.isEmpty && lastName.isEmpty && number.isEmpty) {
    showMessage("All Fields are empty");
    return false;
  } else if (name.isEmpty) {
    showMessage("Enter First Name");
    return false;
  } else if (lastName.isEmpty) {
    showMessage("Enter Last Name");
    return false;
  } else if (number.isEmpty) {
    showMessage("Enter Phone Number");
    return false;
  } else if (number.length != 10) {
    showMessage("Enter 10 digit mobile number.");
    return false;
  } else if (!RegExp(r'^\d+$').hasMatch(number)) {
    showMessage('Please enter only digits in Mobile');
    return false;
  } else {
    return true;
  }
}

// Update Appointment Text Field Validation.
bool updateAppointmentVaildation(
  final String name,
  final String number,
) {
  if (name.isEmpty && number.isEmpty) {
    showMessage("All Fields are empty");
    return false;
  } else if (name.isEmpty) {
    showMessage("Enter First Name");
    return false;
  } else if (number.isEmpty) {
    showMessage("Enter Phone Number");
    return false;
  } else if (number.length != 10) {
    showMessage("Enter 10 digit mobile number.");
    return false;
  } else if (!RegExp(r'^\d+$').hasMatch(number)) {
    showMessage('Please enter only digits in Mobile');
    return false;
  } else {
    return true;
  }
}
