import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_admin_plan/constants/global_variable.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
    webPosition: "center",
    msg: message,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    fontSize: Dimensions.dimenisonNo16,
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

bool formCreateAccount(
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
  String openTime,
  String closeTime,
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
      openTime.isEmpty &&
      closeTime.isEmpty &&
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
  } else if (whatApp.isEmpty) {
    showMessage("WhatApp number not is Empty");
    return false;
  } else if (whatApp.length != 10) {
    showMessage("Enter 10 digit mobile number.");
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
  } else if (openTime.isEmpty) {
    showMessage("${GlobalVariable.salon} open time is not select");
    return false;
  } else if (closeTime.isEmpty) {
    showMessage("${GlobalVariable.salon} closing time is not select");
    return false;
  } else {
    return true;
  }
}

bool formWeekday(
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
