import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';
import 'package:samay_admin_plan/utility/images.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return AppBar(
      backgroundColor: AppColor.mainColor,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.dimenisonNo10,
            vertical: Dimensions.dimenisonNo10),
        child: Row(
          children: [
            // Logo Image
            Image.asset(
              AppImages.logo, // Add your logo asset path here
              height: Dimensions.dimenisonNo40,
            ),
            SizedBox(width: Dimensions.dimenisonNo20),
            // Vertical Divider
            Container(
              width: 3,
              height: Dimensions.dimenisonNo40,
              decoration: const BoxDecoration(color: Colors.white),
            ),

            SizedBox(width: Dimensions.dimenisonNo20),
            // Calendar Icon and Text
            const Icon(Icons.calendar_month_outlined, color: Colors.white),
            SizedBox(width: Dimensions.dimenisonNo5),
            Text(
              'Calendar',
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.dimenisonNo16,
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            SizedBox(width: Dimensions.dimenisonNo20),
            // Sales Icon and Text
            const Icon(Icons.bar_chart, color: Colors.white),
            SizedBox(width: Dimensions.dimenisonNo5),
            Text(
              'Sales',
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.dimenisonNo16,
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const Spacer(),
            // Settings Icon
            SizedBox(width: Dimensions.dimenisonNo20),

            Container(
              decoration: const BoxDecoration(
                color: Colors.white, // Background color
                shape: BoxShape.circle, // Circular shape
              ),
              child: IconButton(
                icon: const Icon(Icons.settings_outlined, color: Colors.black),
                onPressed: () {
                  // Handle the button press
                },
              ),
            ),
            SizedBox(width: Dimensions.dimenisonNo20),
            // Vertical Divider
            Container(
              width: 3,
              height: Dimensions.dimenisonNo40,
              decoration: const BoxDecoration(color: Colors.white),
            ),
            SizedBox(width: Dimensions.dimenisonNo20),
            // Profile Image
            CircleAvatar(
              backgroundImage: AssetImage(
                  AppImages.logo), // Add your profile image asset path here
              radius: Dimensions.dimenisonNo20,
            ),
            SizedBox(width: Dimensions.dimenisonNo20),
            // User and Admin Text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appProvider.getAdminInformation.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.dimenisonNo16,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: Dimensions.dimenisonNo5,
                ),
                Text(
                  'Admin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.dimenisonNo12,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
