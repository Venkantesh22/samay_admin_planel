import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';

class CustomAuthButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const CustomAuthButton({Key? key, required this.text, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimensions.dimenisonNo20),
        decoration: BoxDecoration(
            color: AppColor.bgForAuth,
            borderRadius: BorderRadius.circular(Dimensions.dimenisonNo30)),
        height: Dimensions.dimenisonNo40,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.dimenisonNo16,
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.25,
            ),
          ),
        ),
      ),
    );
  }
}
