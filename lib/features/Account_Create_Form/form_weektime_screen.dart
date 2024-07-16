// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/constants/global_variable.dart';
import 'package:samay_admin_plan/constants/router.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/widget/week_row.dart';
import 'package:samay_admin_plan/features/home/home_screen.dart';
import 'package:samay_admin_plan/models/salon_form_models/salon_infor_model.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';
import 'package:samay_admin_plan/widget/customauthbutton.dart';

class FormTimeSection extends StatefulWidget {
  // final String id;
  // final String name;
  // final String email;
  // final int number;
  // final int whatApp;
  // final String salonType;
  // final String description;
  // final String openTime;
  // final String closeTime;
  // final String address;
  // final String? instagram;
  // final String? facebook;
  // final String? googleMap;
  // final String? linked;
  // final String? image;
  const FormTimeSection({
    Key? key,
    // required this.id,
    // required this.name,
    // required this.email,
    // required this.number,
    // required this.whatApp,
    // required this.salonType,
    // required this.description,
    // required this.openTime,
    // required this.closeTime,
    // required this.address,
    // this.instagram,
    // this.facebook,
    // this.googleMap,
    // this.linked,
    // this.image,
  }) : super(key: key);

  @override
  State<FormTimeSection> createState() => _FormTimeSectionState();
}

class _FormTimeSectionState extends State<FormTimeSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController mondayController = TextEditingController();
  final TextEditingController tuesdayController = TextEditingController();
  final TextEditingController wednesdayController = TextEditingController();
  final TextEditingController thursdayController = TextEditingController();
  final TextEditingController fridayController = TextEditingController();
  final TextEditingController saturdayController = TextEditingController();
  final TextEditingController sundayController = TextEditingController();

  bool isLoading = false;
  void getData() async {
    setState(() {
      isLoading = true;
    });

    // await appProvider.callBackFunction();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.mainColor,
          title: Center(
            child: Text(
              'Saloon Profile Details',
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
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<AppProvider>(builder: (context, value, child) {
                return SingleChildScrollView(
                  child: Container(
                    color: AppColor.bgForAdminCreateSec,
                    child: Center(
                      child: Container(
                        color: Colors.white,
                        width: Dimensions.screenWidth / 2,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: Dimensions.dimenisonNo20,
                              ),
                              Text(
                                'Weekly Schedule',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.dimenisonNo30,
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.15,
                                ),
                              ),
                              Divider(),
                              SizedBox(
                                height: Dimensions.dimenisonNo10,
                              ),
                              WeekRow(
                                  dayOfWeek: "Monday", time: mondayController),
                              WeekRow(
                                  dayOfWeek: "Tuesday",
                                  time: tuesdayController),
                              WeekRow(
                                  dayOfWeek: "Wednesday",
                                  time: wednesdayController),
                              WeekRow(
                                  dayOfWeek: "Thursday",
                                  time: thursdayController),
                              WeekRow(
                                  dayOfWeek: "friday", time: fridayController),
                              WeekRow(
                                  dayOfWeek: "Saturday",
                                  time: saturdayController),
                              WeekRow(
                                  dayOfWeek: "Sunday", time: sundayController),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.dimenisonNo10,
                                    vertical: Dimensions.dimenisonNo20),
                                child: CustomAuthButton(
                                    text: "Save",
                                    ontap: () async {
                                      bool _isVaildated = formWeekday(
                                          mondayController.text,
                                          tuesdayController.text,
                                          wednesdayController.text,
                                          thursdayController.text,
                                          fridayController.text,
                                          saturdayController.text,
                                          sundayController.text);

                                      // appProvider.addWeekday(
                                      //     GlobalVariable.salonID,
                                      //     mondayController.text.trim(),
                                      //     tuesdayController.text.trim(),
                                      //     wednesdayController.text.trim(),
                                      //     thursdayController.text.trim(),
                                      //     fridayController.text.trim(),
                                      //     saturdayController.text.trim(),
                                      //     sundayController.text.trim(),
                                      //     context);

                                      print("hii");

                                      //                          UserModel userModel = appProvider.getUserInformation
                                      //     .copyWith(name: textEditingController.text);
                                      // appProvider.updateUserInfoFirebase(context, userModel, image);

                                      if (_isVaildated) {
                                        SalonModel salonModel = appProvider
                                            .getSalonInformation
                                            .copyWith(
                                          monday: mondayController.text.trim(),
                                          tuesday:
                                              tuesdayController.text.trim(),
                                          wednesday:
                                              wednesdayController.text.trim(),
                                          thursday:
                                              thursdayController.text.trim(),
                                          friday: fridayController.text.trim(),
                                          saturday:
                                              saturdayController.text.trim(),
                                          sunday: sundayController.text.trim(),
                                        );

                                        appProvider.updateSalonInfoFirebase(
                                          context,
                                          salonModel,
                                        );

                                        Routes.instance.pushAndRemoveUntil(
                                            widget: const HomeScreen(),
                                            context: context);
                                      }
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }));
  }
}
