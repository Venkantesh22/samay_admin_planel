// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_admin_plan/constants/router.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/widget/saloon_Time.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/form_weektime_screen.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';
import 'package:samay_admin_plan/widget/customauthbutton.dart';
import 'package:samay_admin_plan/widget/textformField.dart';

class AccountCreateForm extends StatefulWidget {
  const AccountCreateForm({Key? key}) : super(key: key);

  @override
  State<AccountCreateForm> createState() => _AccountCreateFormState();
}

class _AccountCreateFormState extends State<AccountCreateForm> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _salonName = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _mobile = TextEditingController();
    final TextEditingController _descrition = TextEditingController();
    final TextEditingController _address = TextEditingController();
    final TextEditingController _openTime = TextEditingController();
    final TextEditingController _closeTime = TextEditingController();
    final TextEditingController _googleMapLocation = TextEditingController();

    //! For DropDownList
    String? _selectedSalonType;
    final List<String> _salonTypeOptions = [
      'Unisex',
      'Only Male',
      'Only Female',
    ];

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
                  Text(
                    'Upload Saloon Images',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.dimenisonNo18,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        // color: Colors.yellow,
                        borderRadius:
                            BorderRadius.circular(Dimensions.dimenisonNo20)),
                    width: Dimensions.dimenisonNo300,
                    height: Dimensions.dimenisonNo200,
                    child: Icon(
                      Icons.image,
                      size: Dimensions.dimenisonNo200,
                    ),
                  ),
                  FormCustomTextField(
                      controller: _salonName, title: "Saloon Name"),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  FormCustomTextField(
                    controller: _email,
                    title: "Email ID",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  FormCustomTextField(
                    controller: _mobile,
                    title: "Mobile No",
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  Text(
                    "Saloo Type",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.dimenisonNo16,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.dimenisonNo5,
                  ),
                  DropdownButtonFormField<String>(
                    hint: Text(
                      'Select Salon Type',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Dimensions.dimenisonNo16,
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
                        return 'Please select a salon type';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: Dimensions.dimenisonNo10,
                  ),
                  FormCustomTextField(
                    controller: _descrition,
                    title: "Salon Description",
                    maxline: 5,
                  ),
                  SizedBox(
                    height: Dimensions.dimenisonNo10,
                  ),
                  SalonTimeSection(
                      openController: _openTime, closeController: _closeTime),
                  SizedBox(height: Dimensions.dimenisonNo10),

                  FormCustomTextField(
                    controller: _address,
                    title: "Address",
                    maxline: 5,
                  ),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  FormCustomTextField(
                      controller: _googleMapLocation,
                      title: "Add Google Map Location (Location Link)"),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.dimenisonNo10),
                    child: Text(
                      "How to link?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.dimenisonNo16,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.dimenisonNo30),
                    child: Text(
                      "1) Open Google App and Select loction of your Saloon place.\n2) Select a share and copy link\n3) Past a Link in Google Map location textbox",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.dimenisonNo12,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.dimenisonNo20),
                  CustomAuthButton(
                      text: "Save",
                      ontap: () {
                        Routes.instance.push(
                            widget: const FormTimeSection(), context: context);
                      }),

                  // ElevatedButton(
                  //     onPressed: () {
                  //       Routes.instance
                  //           .push(widget: FormTimeSection(), context: context);
                  //     },
                  //     child: Text("hii"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
