import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';
import 'package:samay_admin_plan/provider/service_provider.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';
import 'package:samay_admin_plan/widget/customauthbutton.dart';
import 'package:samay_admin_plan/widget/customtextfield.dart';

class AddNewServices extends StatelessWidget {
  const AddNewServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    final TextEditingController _serviceController = TextEditingController();
    final TextEditingController _priceController = TextEditingController();
    final TextEditingController _hoursController = TextEditingController();
    final TextEditingController _minController = TextEditingController();
    final TextEditingController _descriptionController =
        TextEditingController();

    return AlertDialog(
      titlePadding: EdgeInsets.only(
        left: Dimensions.dimenisonNo20,
        right: Dimensions.dimenisonNo20,
        top: Dimensions.dimenisonNo20,
      ),
      contentPadding: EdgeInsets.symmetric(
          horizontal: Dimensions.dimenisonNo20,
          vertical: Dimensions.dimenisonNo10),
      actionsPadding: EdgeInsets.symmetric(
        vertical: Dimensions.dimenisonNo10,
      ),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add New Category',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.dimenisonNo18,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                ),
              ),
            ],
          ),
          const Divider()
        ],
      ),
      content: SizedBox(
        height: Dimensions.dimenisonNo300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormCustomTextField(
                controller: _serviceController, title: "Service name"),
            SizedBox(
              height: Dimensions.dimenisonNo10,
            ),
            FormCustomTextField(
                controller: _priceController, title: "Service price"),
            SizedBox(
              height: Dimensions.dimenisonNo10,
            ),
            Text(
              'Time duration',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.dimenisonNo18,
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: Dimensions.dimenisonNo10,
                ),
                Text(
                  'Timing',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimensions.dimenisonNo18,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                  ),
                ),
                SizedBox(
                  width: Dimensions.dimenisonNo10,
                ),
                SizedBox(
                  height: Dimensions.dimenisonNo30,
                  width: Dimensions.dimenisonNo50,
                  child: TextFormField(
                    cursorHeight: Dimensions.dimenisonNo16,
                    style: TextStyle(
                        fontSize: Dimensions.dimenisonNo12,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    controller: _hoursController,
                    decoration: InputDecoration(
                      hintText: " HH ",
                      hintStyle: TextStyle(
                        fontSize: Dimensions.dimenisonNo12,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: Dimensions.dimenisonNo10,
                          vertical: Dimensions.dimenisonNo10),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.dimenisonNo16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.dimenisonNo10),
                  child: Text(
                    ':',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.dimenisonNo20,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.dimenisonNo30,
                  width: Dimensions.dimenisonNo50,
                  child: TextFormField(
                    cursorHeight: Dimensions.dimenisonNo16,
                    style: TextStyle(
                        fontSize: Dimensions.dimenisonNo12,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    controller: _minController,
                    decoration: InputDecoration(
                      hintText: " MM ",
                      hintStyle: TextStyle(
                        fontSize: Dimensions.dimenisonNo12,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: Dimensions.dimenisonNo10,
                          vertical: Dimensions.dimenisonNo10),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.dimenisonNo16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.dimenisonNo10,
            ),
            FormCustomTextField(
                controller: _descriptionController,
                title: "Service Description"),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAuthButton(
              buttonWidth: Dimensions.dimenisonNo150,
              text: "Cancel",
              bgColor: Colors.red,
              ontap: () {
                Navigator.pop(context);
              },
            ),
            CustomAuthButton(
              buttonWidth: Dimensions.dimenisonNo150,
              text: "Save",
              ontap: () async {
                // try {
                //   showLoaderDialog(context);

                //   bool isVaildated =
                //       addNewCategoryVaildation(_categoryController.text);

                //   if (isVaildated) {
                //     await serviceProvider.addNewCategoryPro(
                //         appProvider.getAdminInformation.id,
                //         appProvider.getSalonInformation.id,
                //         _categoryController.text.trim(),
                //         context);
                //     Navigator.of(context, rootNavigator: true).pop();
                //     Routes.instance
                //         .push(widget: ServicesPages(), context: context);
                //     showMessage("New Category add Successfully");
                //     Navigator.of(context, rootNavigator: true).pop();
                //   }
                //   Navigator.of(context, rootNavigator: true).pop();
                // } catch (e) {
                //   showMessage("Error create new Category ${e.toString()}");
                //   Navigator.pop(context);
                // }
              },
            ),
          ],
        ),
      ],
    );
  }
}
