import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_admin_plan/constants/global_variable.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/widget/week_row.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';
import 'package:samay_admin_plan/widget/customauthbutton.dart';

class FormTimeSection extends StatefulWidget {
  const FormTimeSection({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
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
                    WeekRow(dayOfWeek: "Monday", time: mondayController),
                    WeekRow(dayOfWeek: "Tuesday", time: tuesdayController),
                    WeekRow(dayOfWeek: "Wednesday", time: wednesdayController),
                    WeekRow(dayOfWeek: "Thursday", time: thursdayController),
                    WeekRow(dayOfWeek: "friday", time: fridayController),
                    WeekRow(dayOfWeek: "Saturday", time: saturdayController),
                    WeekRow(dayOfWeek: "Sunday", time: sundayController),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.dimenisonNo10,
                          vertical: Dimensions.dimenisonNo20),
                      child: CustomAuthButton(text: "Save", ontap: () {}),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
