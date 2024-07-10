// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_string_interpolations

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/constants/global_variable.dart';
import 'package:samay_admin_plan/constants/router.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/widget/salon_social_media_add.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/widget/saloon_Time.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/form_weektime_screen.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';
import 'package:samay_admin_plan/widget/customauthbutton.dart';
import 'package:samay_admin_plan/widget/customtextfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountCreateForm extends StatefulWidget {
  const AccountCreateForm({Key? key}) : super(key: key);

  @override
  State<AccountCreateForm> createState() => _AccountCreateFormState();
}

class _AccountCreateFormState extends State<AccountCreateForm> {
  final TextEditingController _salonName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _whatApp = TextEditingController();
  final TextEditingController _descrition = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _openTime = TextEditingController();
  final TextEditingController _closeTime = TextEditingController();
  final TextEditingController _instagram = TextEditingController();
  final TextEditingController _facebook = TextEditingController();
  final TextEditingController _googleMap = TextEditingController();
  final TextEditingController _linked = TextEditingController();
  String? adminUid = FirebaseAuth.instance.currentUser?.uid;

  //! For DropDownList
  String? _selectedSalonType;
  final List<String> _salonTypeOptions = [
    'Unisex',
    'Only Male',
    'Only Female',
  ];

  Uint8List? selectedImage;

  chooseImages() async {
    FilePickerResult? chosenImageFile =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (chosenImageFile != null) {
      setState(() {
        selectedImage = chosenImageFile.files.single.bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: Center(
          child: Text(
            '${GlobalVariable.salon} Profile Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.dimenisonNo30,
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: AppColor.bgForAdminCreateSec,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.dimenisonNo30,
                  vertical: Dimensions.dimenisonNo20),
              color: Colors.white,
              width: Dimensions.screenWidth / 1.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Upload ${GlobalVariable.salon} Images ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.dimenisonNo18,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                        ),
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                            color: const Color(0xFFFC0000),
                            fontSize: Dimensions.dimenisonNo18,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 0.15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  selectedImage == null
                      ? InkWell(
                          onTap: chooseImages,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.dimenisonNo20)),
                            width: Dimensions.dimenisonNo300,
                            height: Dimensions.dimenisonNo200,
                            child: Icon(
                              Icons.image,
                              size: Dimensions.dimenisonNo200,
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: chooseImages,
                          child: Container(
                            margin:
                                EdgeInsets.only(left: Dimensions.dimenisonNo20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.dimenisonNo20)),
                            width: Dimensions.dimenisonNo300,
                            height: Dimensions.dimenisonNo200,
                            clipBehavior: Clip.antiAlias,
                            child: Image.memory(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  FormCustomTextField(
                    controller: _salonName,
                    title: "${GlobalVariable.salon} Name",
                  ),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  FormCustomTextField(
                    controller: _email,
                    title: "Email ID",
                  ),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  FormCustomTextField(
                    controller: _mobile,
                    title: "Mobile No",
                  ),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  FormCustomTextField(
                    controller: _whatApp,
                    title: "WhatApp No",
                  ),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${GlobalVariable.salon} Type ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.dimenisonNo18,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                        ),
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                            color: const Color(0xFFFC0000),
                            fontSize: Dimensions.dimenisonNo18,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 0.15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.dimenisonNo5),
                  DropdownButtonFormField<String>(
                    hint: Text(
                      'Select ${GlobalVariable.salon} Type',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Dimensions.dimenisonNo16,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.40,
                      ),
                    ),
                    value: _selectedSalonType,
                    items: _salonTypeOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedSalonType = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a ${GlobalVariable.salon} type';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  FormCustomTextField(
                    controller: _descrition,
                    title: "${GlobalVariable.salon} Description",
                    maxline: 5,
                  ),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  // select a time
                  SalonTimeSection(
                    openController: _openTime,
                    closeController: _closeTime,
                  ),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  FormCustomTextField(
                    controller: _address,
                    title: "Address",
                    maxline: 5,
                  ),
                  SizedBox(height: Dimensions.dimenisonNo20),
                  Text(
                    'Social media Information',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.dimenisonNo16,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      letterSpacing: 0.15,
                    ),
                  ),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  Column(
                    children: [
                      SalonSocialMediaAdd(
                        text: "Instagram",
                        icon: FontAwesomeIcons.instagram,
                        controller: _instagram,
                      ),
                      SalonSocialMediaAdd(
                        text: "Facebook",
                        icon: FontAwesomeIcons.facebook,
                        controller: _facebook,
                      ),
                      SalonSocialMediaAdd(
                        text: "Google Map",
                        icon: FontAwesomeIcons.mapLocationDot,
                        controller: _googleMap,
                      ),
                      SalonSocialMediaAdd(
                        text: "Linkedin",
                        icon: FontAwesomeIcons.linkedin,
                        controller: _linked,
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.dimenisonNo20),
                  CustomAuthButton(
                    text: "Save",
                    ontap: () {
                      // print(" open Time :${_openTime.text} \n");
                      // print(" close Time :${_closeTime.text}");
                      // print(" open Time glo :${GlobalVariable.OpenTime} \n");
                      // print(" close Time glo :${GlobalVariable.CloseTime}");
                      print(" open Time  :${GlobalVariable.OpenTimeGlo} \n");
                      print(" close Time  :${GlobalVariable.closerTimeGlo}");

                      bool _isVaildated = formCreateAccount(
                        _salonName.text,
                        _email.text,
                        _mobile.text,
                        _whatApp.text,
                        _selectedSalonType!,
                        _descrition.text,
                        _address.text,
                        _openTime.text,
                        _closeTime.text,
                        _instagram.text,
                        _facebook.text,
                        _googleMap.text,
                        _instagram.text,
                        selectedImage!,
                      );

                      // if (_isVaildated) {
                      //   appProvider.addsalonInfoForm(
                      //       selectedImage!,
                      //       _salonName.text.trim(),
                      //       _email.text.trim(),
                      //       _mobile.text.trim(),
                      //       _whatApp.text.trim(),
                      //       _selectedSalonType!,
                      //       _descrition.text.trim(),
                      //       _address.text.trim(),
                      //       _openTime.text.trim(),
                      //       _closeTime.text.trim(),
                      //       _instagram.text.trim(),
                      //       _facebook.text.trim(),
                      //       _googleMap.text.trim(),
                      //       _instagram.text.trim(),
                      //       context);
                      //   showMessage("Salon Information Successfully add");
                      Routes.instance.push(
                          widget: const FormTimeSection(), context: context);
                      // }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class AccountCreateForm extends StatefulWidget {
//   const AccountCreateForm({Key? key}) : super(key: key);

//   @override
//   State<AccountCreateForm> createState() => _AccountCreateFormState();
// }

// class _AccountCreateFormState extends State<AccountCreateForm> {
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController _salonName = TextEditingController();
//     final TextEditingController _email = TextEditingController();
//     final TextEditingController _mobile = TextEditingController();
//     final TextEditingController _whatApp = TextEditingController();
//     final TextEditingController _descrition = TextEditingController();
//     final TextEditingController _address = TextEditingController();
//     final TextEditingController _openTime = TextEditingController();
//     final TextEditingController _closeTime = TextEditingController();
//     final TextEditingController _instagram = TextEditingController();
//     final TextEditingController _facebook = TextEditingController();
//     final TextEditingController _googleMap = TextEditingController();
//     final TextEditingController _linked = TextEditingController();

//     //! For DropDownList
//     String? _selectedSalonType;
//     final List<String> _salonTypeOptions = [
//       'Unisex',
//       'Only Male',
//       'Only Female',
//     ];

//     Uint8List? selectedImage;

//     chooseImages() async {
//       FilePickerResult? chosenImageFile =
//           await FilePicker.platform.pickFiles(type: FileType.image);
//       if (chosenImageFile != null) {
//         setState(() {
//           selectedImage = chosenImageFile.files.single.bytes;
//         });
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColor.mainColor,
//         title: Center(
//           child: Text(
//             '${GlobalVariable.salon} Profile Details',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: Dimensions.dimenisonNo30,
//               fontFamily: GoogleFonts.roboto().fontFamily,
//               fontWeight: FontWeight.w500,
//               letterSpacing: 0.15,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//           color: AppColor.bgForAdminCreateSec,
//           child: Center(
//             child: Container(
//               padding: EdgeInsets.symmetric(
//                   horizontal: Dimensions.dimenisonNo30,
//                   vertical: Dimensions.dimenisonNo20),
//               color: Colors.white,
//               width: Dimensions.screenWidth / 1.5,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text.rich(
//                     TextSpan(
//                       children: [
//                         TextSpan(
//                           text: 'Upload ${GlobalVariable.salon} Images ',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: Dimensions.dimenisonNo18,
//                             fontFamily: GoogleFonts.roboto().fontFamily,
//                             fontWeight: FontWeight.w500,
//                             letterSpacing: 0.15,
//                           ),
//                         ),
//                         TextSpan(
//                           text: '*',
//                           style: TextStyle(
//                             color: const Color(0xFFFC0000),
//                             fontSize: Dimensions.dimenisonNo18,
//                             fontFamily: GoogleFonts.roboto().fontFamily,
//                             fontWeight: FontWeight.w500,
//                             height: 0,
//                             letterSpacing: 0.15,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   selectedImage == null
//                       ? InkWell(
//                           onTap: chooseImages,
//                           child: CircleAvatar(
//                             radius: Dimensions.dimenisonNo35,
//                             child: const Icon(Icons.camera_alt),
//                           ),
//                         )
//                       : InkWell(
//                           onTap: chooseImages,
//                           child: Container(
//                             width: Dimensions.dimenisonNo70,
//                             height: Dimensions.dimenisonNo70,
//                             clipBehavior: Clip.antiAlias,
//                             decoration: ShapeDecoration(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                             ),
//                             child: Image.memory(
//                               selectedImage!,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                   // InkWell(
//                   //   onTap: chooseImages,
//                   //   child: Container(
//                   //     decoration: BoxDecoration(
//                   //         borderRadius:
//                   //             BorderRadius.circular(Dimensions.dimenisonNo20)),
//                   //     width: Dimensions.dimenisonNo300,
//                   //     height: Dimensions.dimenisonNo200,
//                   //     child: _selectedImage == null
//                   //         ? Icon(
//                   //             Icons.image,
//                   //             size: Dimensions.dimenisonNo200,
//                   //           )
//                   //         : Image.memory(
//                   //             _selectedImage!,
//                   //             fit: BoxFit.contain,
//                   //           ),
//                   //   ),
//                   // ),
//                   FormCustomTextField(
//                       controller: _salonName,
//                       title: "${GlobalVariable.salon} Name"),
//                   SizedBox(height: Dimensions.dimenisonNo10),
//                   FormCustomTextField(
//                     controller: _email,
//                     title: "Email ID",
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   SizedBox(height: Dimensions.dimenisonNo10),
//                   FormCustomTextField(
//                     controller: _mobile,
//                     title: "Mobile No",
//                     keyboardType: TextInputType.number,
//                   ),
//                   SizedBox(height: Dimensions.dimenisonNo10),
//                   FormCustomTextField(
//                     controller: _whatApp,
//                     title: "WhatApp No",
//                     keyboardType: TextInputType.number,
//                   ),
//                   SizedBox(height: Dimensions.dimenisonNo10),
//                   Text.rich(
//                     TextSpan(
//                       children: [
//                         TextSpan(
//                           text: '${GlobalVariable.salon} Type ',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: Dimensions.dimenisonNo18,
//                             fontFamily: GoogleFonts.roboto().fontFamily,
//                             fontWeight: FontWeight.w500,
//                             letterSpacing: 0.15,
//                           ),
//                         ),
//                         TextSpan(
//                           text: '*',
//                           style: TextStyle(
//                             color: const Color(0xFFFC0000),
//                             fontSize: Dimensions.dimenisonNo18,
//                             fontFamily: GoogleFonts.roboto().fontFamily,
//                             fontWeight: FontWeight.w500,
//                             height: 0,
//                             letterSpacing: 0.15,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   SizedBox(
//                     height: Dimensions.dimenisonNo5,
//                   ),
//                   DropdownButtonFormField<String>(
//                     hint: Text(
//                       'Select ${GlobalVariable.salon} Type',
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: Dimensions.dimenisonNo16,
//                         fontFamily: GoogleFonts.roboto().fontFamily,
//                         fontWeight: FontWeight.w500,
//                         letterSpacing: 0.40,
//                       ),
//                     ),
//                     value: _selectedSalonType,
//                     items: _salonTypeOptions.map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (newValue) {
//                       setState(() {
//                         _selectedSalonType = newValue;
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select a ${GlobalVariable.salon} type';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: Dimensions.dimenisonNo10,
//                   ),
//                   FormCustomTextField(
//                     controller: _descrition,
//                     title: "${GlobalVariable.salon} Description",
//                     maxline: 5,
//                   ),
//                   SizedBox(
//                     height: Dimensions.dimenisonNo10,
//                   ),
//                   SalonTimeSection(
//                       openController: _openTime, closeController: _closeTime),
//                   SizedBox(height: Dimensions.dimenisonNo10),

//                   FormCustomTextField(
//                     controller: _address,
//                     title: "Address",
//                     maxline: 5,
//                   ),
//                   SizedBox(height: Dimensions.dimenisonNo20),
//                   Text(
//                     'Social media Information',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: Dimensions.dimenisonNo16,
//                       fontWeight: FontWeight.w500,
//                       fontFamily: GoogleFonts.roboto().fontFamily,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                   SizedBox(height: Dimensions.dimenisonNo10),
//                   Column(
//                     children: [
//                       SalonSocialMediaAdd(
//                           text: "Instagram",
//                           icon: FontAwesomeIcons.instagram,
//                           controller: _instagram),
//                       SalonSocialMediaAdd(
//                           text: "Facebook",
//                           icon: FontAwesomeIcons.facebook,
//                           controller: _facebook),
//                       SalonSocialMediaAdd(
//                           text: "Google Map",
//                           icon: FontAwesomeIcons.mapPin,
//                           controller: _googleMap),
//                       SalonSocialMediaAdd(
//                           text: "Linkedin",
//                           icon: FontAwesomeIcons.linkedin,
//                           controller: _linked),
//                     ],
//                   ),

//                   SizedBox(height: Dimensions.dimenisonNo20),
//                   CustomAuthButton(
//                       text: "Save",
//                       ontap: () {
//                         Routes.instance.push(
//                             widget: const FormTimeSection(), context: context);
//                       }),
//                 ],
