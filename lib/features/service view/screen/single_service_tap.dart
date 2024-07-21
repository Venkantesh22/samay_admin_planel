import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:samay_admin_plan/models/service%20model/service_model.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';

class SingleServiceTap extends StatelessWidget {
  final ServiceModel serviceModel;
  const SingleServiceTap({
    Key? key,
    required this.serviceModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.dimenisonNo10,
          vertical: Dimensions.dimenisonNo16),
      //  Single Services Container
      child: Container(
        margin: EdgeInsets.only(right: Dimensions.dimenisonNo200),
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.dimenisonNo10,
            vertical: Dimensions.dimenisonNo10),
        height: Dimensions.dimenisonNo200,
        decoration: ShapeDecoration(
          color: AppColor.bgForAdminCreateSec,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1),
            borderRadius: BorderRadius.circular(Dimensions.dimenisonNo10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Row(
              children: [
                Text(
                  serviceModel.servicesName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimensions.dimenisonNo20,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.04,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit_square,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: Dimensions.dimenisonNo10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),

            // subtitile
            Row(
              children: [
                Icon(
                  Icons.currency_rupee,
                  size: Dimensions.dimenisonNo16,
                ),
                Text(
                  serviceModel.price.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimensions.dimenisonNo16,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                  ),
                ),
                SizedBox(
                  width: Dimensions.dimenisonNo20,
                ),
                Icon(
                  Icons.watch_later_outlined,
                  size: Dimensions.dimenisonNo16,
                ),
                SizedBox(
                  width: Dimensions.dimenisonNo10,
                ),
                Text(
                  "${serviceModel.hours.toString()}:${serviceModel.minutes.toString()} hr.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimensions.dimenisonNo16,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                  ),
                ),
              ],
            ),
            Divider(),
            Expanded(
              child: Text(
                serviceModel.description,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.dimenisonNo16,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
