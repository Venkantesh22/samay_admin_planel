import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';

class StateText extends StatelessWidget {
  final String status; // Mark orderModel as final
  const StateText({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if orderModel is null and handle it gracefully
    if (status == null) {
      return Text(
        'Status not available',
        style: GoogleFonts.roboto(
          fontSize: Dimensions.dimenisonNo16,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // reschedule state
        if (status == "Reschedule")
          Row(
            children: [
              Icon(
                CupertinoIcons.exclamationmark_circle,
                size: Dimensions.dimenisonNo18,
                color: AppColor.buttonColor,
              ),
              SizedBox(width: Dimensions.dimenisonNo5),
              Text(
                status,
                style: GoogleFonts.roboto(
                  fontSize: Dimensions.dimenisonNo16,
                  color: AppColor.buttonColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        // Pending state
        if (status == "Pending")
          Row(
            children: [
              Icon(
                CupertinoIcons.exclamationmark_circle,
                size: Dimensions.dimenisonNo18,
                color: Colors.red,
              ),
              SizedBox(width: Dimensions.dimenisonNo5),
              Text(
                status,
                style: GoogleFonts.roboto(
                  fontSize: Dimensions.dimenisonNo16,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        // Confirmed state
        if (status == "Confirmed")
          Row(
            children: [
              Icon(
                CupertinoIcons.checkmark_alt_circle,
                size: Dimensions.dimenisonNo18,
                color: AppColor.buttonColor,
              ),
              SizedBox(width: Dimensions.dimenisonNo5),
              Text(
                status,
                style: GoogleFonts.roboto(
                  fontSize: Dimensions.dimenisonNo16,
                  color: AppColor.buttonColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        // Completed state
        if (status == "Completed")
          Row(
            children: [
              Icon(
                CupertinoIcons.checkmark_alt_circle,
                size: Dimensions.dimenisonNo18,
                color: Colors.blue,
              ),
              SizedBox(width: Dimensions.dimenisonNo5),
              Text(
                status,
                style: GoogleFonts.roboto(
                  fontSize: Dimensions.dimenisonNo16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        // Cancel state
        if (status == "Cancel")
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.red),
                ),
                child: Icon(
                  Icons.close,
                  size: Dimensions.dimenisonNo16,
                  color: Colors.red,
                ),
              ),
              SizedBox(width: Dimensions.dimenisonNo5),
              Text(
                status,
                style: GoogleFonts.roboto(
                  fontSize: Dimensions.dimenisonNo16,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
