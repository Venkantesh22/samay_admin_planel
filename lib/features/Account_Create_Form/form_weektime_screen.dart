import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_admin_plan/constants/global_variable.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/widget/week_row.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';

class FormTimeSection extends StatefulWidget {
  const FormTimeSection({Key? key}) : super(key: key);

  @override
  State<FormTimeSection> createState() => _FormTimeSectionState();
}

class _FormTimeSectionState extends State<FormTimeSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController mondayController = TextEditingController();
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
      body: Container(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
