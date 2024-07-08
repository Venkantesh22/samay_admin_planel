// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/constants/router.dart';
import 'package:samay_admin_plan/features/auth/login.dart';
import 'package:samay_admin_plan/features/home/home_screen.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_admin_plan/widget/customauthbutton.dart';
import 'package:samay_admin_plan/widget/textformField.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({Key? key}) : super(key: key);

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Uint8List? selectedImage;

  chooseImages() async {
    FilePickerResult? chosenImageFile =
        await FilePicker.platform.pickFiles(type: FileType.image);
    setState(() {
      selectedImage = chosenImageFile!.files.single.bytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgForAuth,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(Dimensions.dimenisonNo30),
          padding: EdgeInsets.all(Dimensions.dimenisonNo20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.dimenisonNo10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.dimenisonNo20,
                    vertical: Dimensions.dimenisonNo10),
                decoration: BoxDecoration(
                    color: AppColor.bgForAdminCreateSec,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius:
                        BorderRadius.circular(Dimensions.dimenisonNo20)),
                width: Dimensions.dimenisonNo400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create an Admin Login',
                      style: TextStyle(
                        color: AppColor.createText,
                        fontSize: Dimensions.dimenisonNo24,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: Dimensions.dimenisonNo5),
                    selectedImage == null
                        ? InkWell(
                            onTap: () {
                              chooseImages();
                            },
                            child: CircleAvatar(
                                radius: Dimensions.dimenisonNo35,
                                child: const Icon(Icons.camera_alt)),
                          )
                        : InkWell(
                            onTap: () {
                              chooseImages();
                            },
                            child: Container(
                              width: Dimensions.dimenisonNo70,
                              height: Dimensions.dimenisonNo70,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Image.memory(
                                selectedImage!,
                                fit: BoxFit.cover,
                              ),
                            )),
                    SizedBox(height: Dimensions.dimenisonNo10),
                    CustomTextField(
                        controller: _nameController,
                        obscureForPassword: false,
                        keyboardType: TextInputType.name,
                        label: "Name"),
                    SizedBox(height: Dimensions.dimenisonNo10),
                    CustomTextField(
                        controller: _emailController,
                        obscureForPassword: false,
                        keyboardType: TextInputType.emailAddress,
                        label: "Email"),
                    SizedBox(height: Dimensions.dimenisonNo10),
                    CustomTextField(
                        controller: _mobileController,
                        obscureForPassword: false,
                        keyboardType: TextInputType.number,
                        label: "Mobile Number"),
                    SizedBox(height: Dimensions.dimenisonNo10),
                    CustomTextField(
                        controller: _passwordController,
                        obscureForPassword: true,
                        keyboardType: TextInputType.name,
                        label: "Password"),
                    SizedBox(height: Dimensions.dimenisonNo20),
                    CustomAuthButton(
                      text: "SingUp",
                      ontap: () async {
                        bool isVaildated = signUpVaildation(
                            _emailController.text,
                            _passwordController.text,
                            _nameController.text,
                            _mobileController.text);
                        if (isVaildated) {
                          bool isLogined = await FirebaseAuthHelper.instance
                              .signUp(
                                  _nameController.text.trim(),
                                  _mobileController.text.trim(),
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                  selectedImage!,
                                  context);

                          if (isLogined) {
                            Routes.instance.pushAndRemoveUntil(
                                widget: const HomeScreen(), context: context);
                          }
                        }
                      },
                    ),
                    SizedBox(height: Dimensions.dimenisonNo10),
                    InkWell(
                      onTap: () {
                        Routes.instance.push(
                            widget: const LoginScreen(), context: context);
                      },
                      child: Text(
                        'Alread have an account? Login',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.dimenisonNo16,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          letterSpacing: 0.15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: Dimensions.dimenisonNo60,
              ),
              Column(
                children: [
                  Text(
                    'Main hu Samay,                     ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.dimenisonNo30,
                      fontFamily: GoogleFonts.inknutAntiqua().fontFamily,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.15,
                    ),
                  ),
                  Text(
                    '      mere Sath chalo.!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.dimenisonNo30,
                      fontFamily: GoogleFonts.inknutAntiqua().fontFamily,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.15,
                    ),
                  ),
                  Image.asset(
                    "assets/images/cartoon.png",
                    height: Dimensions.dimenisonNo400,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}