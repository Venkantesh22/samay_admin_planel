// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/constants/global_variable.dart';
import 'package:samay_admin_plan/models/category%20model/category_model.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';
import 'package:samay_admin_plan/provider/service_provider.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';
import 'package:samay_admin_plan/widget/customauthbutton.dart';
import 'package:samay_admin_plan/widget/customtextfield.dart';

class AddServiceForm extends StatelessWidget {
  final CategoryModel categoryModel;
  const AddServiceForm({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

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
    return Scaffold(
      backgroundColor: AppColor.bgForAdminCreateSec,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          // color: Colors.grey,
          color: AppColor.bgForAdminCreateSec,
          child: Container(
            alignment: Alignment.topLeft,
            width: Dimensions.screenWidth / 1.5,
            // margin: EdgeInsets.only(top: Dimensions.dimenisonNo30),
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.dimenisonNo30,
                vertical: Dimensions.dimenisonNo30),
            decoration: BoxDecoration(
              // color: Colors.green,
              color: Colors.white,
              // borderRadius: BorderRadius.circular(Dimensions.dimenisonNo20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add New Service in ${categoryModel.categoryName} Category',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.dimenisonNo24,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close)),
                  ],
                ),
                const Divider(),
                SizedBox(
                  height: Dimensions.dimenisonNo20,
                ),
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
                    maxline: 4,
                    controller: _descriptionController,
                    title: "Service Description"),
                SizedBox(
                  height: Dimensions.dimenisonNo10,
                ),
                CustomAuthButton(
                  text: "Save",
                  ontap: () async {
                    try {
                      showLoaderDialog(context);
                      bool isVaildated = addNewServiceVaildation(
                          _serviceController.text,
                          _priceController.text,
                          _hoursController.text,
                          _minController.text,
                          _descriptionController.text);

                      if (isVaildated) {
                        await serviceProvider.addServicePro(
                            appProvider.getAdminInformation.id,
                            appProvider.getSalonInformation.id,
                            categoryModel.id,
                            _serviceController.text.trim(),
                            double.parse(_priceController.text.trim()),
                            double.parse(_hoursController.text.trim()),
                            double.parse(_minController.text.trim()),
                            _descriptionController.text.trim());
                        Navigator.pop(context);
                        showMessage("New Service add Successfully");
                      }
                      Navigator.of(context, rootNavigator: true).pop();
                    } catch (e) {
                      Navigator.of(context, rootNavigator: true).pop();

                      showMessage("Error create add Service ${e.toString()}");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:samay_admin_plan/constants/constants.dart';
// import 'package:samay_admin_plan/constants/global_variable.dart';
// import 'package:samay_admin_plan/models/category%20model/category_model.dart';
// import 'package:samay_admin_plan/provider/app_provider.dart';
// import 'package:samay_admin_plan/provider/service_provider.dart';
// import 'package:samay_admin_plan/utility/color.dart';
// import 'package:samay_admin_plan/utility/dimenison.dart';
// import 'package:samay_admin_plan/widget/customauthbutton.dart';
// import 'package:samay_admin_plan/widget/customtextfield.dart';

// class AddServiceForm extends StatelessWidget {
//   final CategoryModel categoryModel;
//   const AddServiceForm({
//     Key? key,
//     required this.categoryModel,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     AppProvider appProvider = Provider.of<AppProvider>(context);
//     ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
//     final TextEditingController _serviceController = TextEditingController();
//     final TextEditingController _priceController = TextEditingController();
//     final TextEditingController _hoursController = TextEditingController();
//     final TextEditingController _minController = TextEditingController();
//     final TextEditingController _descriptionController =
//         TextEditingController();
//     return Scaffold(
//       backgroundColor: AppColor.bgForAdminCreateSec,
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//           // color: Colors.grey,
//           color: AppColor.bgForAdminCreateSec,
//           child: Container(
//             alignment: Alignment.topLeft,
//             width: Dimensions.screenWidth / 1.5,
//             margin: EdgeInsets.only(top: Dimensions.dimenisonNo30),
//             padding: EdgeInsets.symmetric(
//                 horizontal: Dimensions.dimenisonNo30,
//                 vertical: Dimensions.dimenisonNo30),
//             decoration: BoxDecoration(
//                 // color: Colors.green,
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(Dimensions.dimenisonNo20)),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Add New Category',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: Dimensions.dimenisonNo24,
//                         fontFamily: GoogleFonts.roboto().fontFamily,
//                         fontWeight: FontWeight.w500,
//                         letterSpacing: 0.15,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Divider(),
//                 SizedBox(
//                   height: Dimensions.dimenisonNo20,
//                 ),
//                 FormCustomTextField(
//                     controller: _serviceController, title: "Service name"),
//                 SizedBox(
//                   height: Dimensions.dimenisonNo10,
//                 ),
//                 FormCustomTextField(
//                     controller: _priceController, title: "Service price"),
//                 SizedBox(
//                   height: Dimensions.dimenisonNo10,
//                 ),
//                 Text(
//                   'Time duration',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: Dimensions.dimenisonNo18,
//                     fontFamily: GoogleFonts.roboto().fontFamily,
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: 0.15,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(
//                       width: Dimensions.dimenisonNo10,
//                     ),
//                     Text(
//                       'Timing',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: Dimensions.dimenisonNo18,
//                         fontFamily: GoogleFonts.roboto().fontFamily,
//                         fontWeight: FontWeight.w500,
//                         letterSpacing: 0.15,
//                       ),
//                     ),
//                     SizedBox(
//                       width: Dimensions.dimenisonNo10,
//                     ),
//                     SizedBox(
//                       height: Dimensions.dimenisonNo30,
//                       width: Dimensions.dimenisonNo50,
//                       child: TextFormField(
//                         cursorHeight: Dimensions.dimenisonNo16,
//                         style: TextStyle(
//                             fontSize: Dimensions.dimenisonNo12,
//                             fontFamily: GoogleFonts.roboto().fontFamily,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                         controller: _hoursController,
//                         decoration: InputDecoration(
//                           hintText: " HH ",
//                           hintStyle: TextStyle(
//                             fontSize: Dimensions.dimenisonNo12,
//                             fontFamily: GoogleFonts.roboto().fontFamily,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                               horizontal: Dimensions.dimenisonNo10,
//                               vertical: Dimensions.dimenisonNo10),
//                           border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.circular(Dimensions.dimenisonNo16),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: Dimensions.dimenisonNo10),
//                       child: Text(
//                         ':',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: Dimensions.dimenisonNo20,
//                           fontFamily: GoogleFonts.roboto().fontFamily,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 0.15,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: Dimensions.dimenisonNo30,
//                       width: Dimensions.dimenisonNo50,
//                       child: TextFormField(
//                         cursorHeight: Dimensions.dimenisonNo16,
//                         style: TextStyle(
//                             fontSize: Dimensions.dimenisonNo12,
//                             fontFamily: GoogleFonts.roboto().fontFamily,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                         controller: _minController,
//                         decoration: InputDecoration(
//                           hintText: " MM ",
//                           hintStyle: TextStyle(
//                             fontSize: Dimensions.dimenisonNo12,
//                             fontFamily: GoogleFonts.roboto().fontFamily,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                               horizontal: Dimensions.dimenisonNo10,
//                               vertical: Dimensions.dimenisonNo10),
//                           border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.circular(Dimensions.dimenisonNo16),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: Dimensions.dimenisonNo10,
//                 ),
//                 FormCustomTextField(
//                     maxline: 4,
//                     controller: _descriptionController,
//                     title: "Service Description"),
//                 SizedBox(
//                   height: Dimensions.dimenisonNo10,
//                 ),
//                 CustomAuthButton(
//                   text: "Save",
//                   ontap: () async {
//                     try {
//                       showLoaderDialog(context);
//                       bool isVaildated = addNewServiceVaildation(
//                           _serviceController.text,
//                           _priceController.text,
//                           _hoursController.text,
//                           _minController.text,
//                           _descriptionController.text);

//                       if (isVaildated) {
//                         await serviceProvider.addServicePro(
//                             appProvider.getAdminInformation.id,
//                             appProvider.getSalonInformation.id,
//                             categoryModel.id,
//                             _serviceController.text.trim(),
//                             double.parse(_priceController.text.trim()),
//                             double.parse(_hoursController.text.trim()),
//                             double.parse(_minController.text.trim()),
//                             _descriptionController.text.trim());
//                         Navigator.of(context, rootNavigator: true).pop();
//                         Navigator.of(context, rootNavigator: true).pop();

//                         showMessage("New Category add Successfully");
//                       }
//                       Navigator.of(context, rootNavigator: true).pop();
//                     } catch (e) {
//                       Navigator.of(context, rootNavigator: true).pop();

//                       showMessage("Error create add Service ${e.toString()}");
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
