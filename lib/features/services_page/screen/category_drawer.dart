// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/constants/router.dart';
import 'package:samay_admin_plan/features/popup/add_new_category.dart';
import 'package:samay_admin_plan/features/services_page/screen/services_page.dart';
import 'package:samay_admin_plan/features/services_page/widget/category_button.dart';

import 'package:samay_admin_plan/models/category%20model/category_model.dart';
import 'package:samay_admin_plan/models/salon_form_models/salon_infor_model.dart';
import 'package:samay_admin_plan/one_time_run_function/initialize_default_category.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';
import 'package:samay_admin_plan/provider/service_provider.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';
import 'package:samay_admin_plan/widget/add_button.dart';

// class CatergoryDrawer extends StatefulWidget {
//   const CatergoryDrawer({Key? key}) : super(key: key);

//   @override
//   State<CatergoryDrawer> createState() => _CatergoryDrawerState();
// }

// class _CatergoryDrawerState extends State<CatergoryDrawer> {
//   bool isLoading = false;

//   void getDate() async {
//     setState(() {
//       isLoading = true;
//     });
//     AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
//     ServiceProvider serviceProvider =
//         Provider.of<ServiceProvider>(context, listen: false);
//     await serviceProvider.callBackFunction(appProvider.getSalonInformation.id);
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     getDate();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     AppProvider appProvider = Provider.of<AppProvider>(context);
//     ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);

//     return appProvider.getSalonInformation.isDefaultCategoryCreate
//         ? isLoading
//             ? const Center(child: CircularProgressIndicator())
//             : Material(
//                 child: Container(
//                   width: Dimensions
//                       .dimenisonNo250, // Ensure the drawer has a fixed width
//                   // color: AppColor.mainColor,
//                   color: const Color.fromARGB(255, 55, 54, 54),
//                   // color: Color(0xFFE8E8E8),
//                   child: Column(
//                     children: [
//                       AddButton(
//                         text: "Add Category",
//                         bgColor: Colors.white,
//                         textColor: Colors.black,
//                         iconColor: Colors.black,
//                         onTap: () {
//                           showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return const AddNewCategory();
//                               });
//                         },
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: Dimensions.dimenisonNo5,
//                             vertical: Dimensions.dimenisonNo10),
//                         child: Center(
//                           child: Text(
//                             'Categories',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: Dimensions.dimenisonNo24,
//                               fontFamily: GoogleFonts.roboto().fontFamily,
//                               fontWeight: FontWeight.w500,
//                               letterSpacing: 0.15,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(Dimensions.dimenisonNo10),
//                         child: const Divider(),
//                       ),
//                       Expanded(
//                         child: StreamBuilder<List<CategoryModel>>(
//                           stream: serviceProvider.getCategoryListFirebase(
//                               appProvider.getSalonInformation.id),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return const Center(
//                                   child: CircularProgressIndicator());
//                             }
//                             if (snapshot.hasError) {
//                               return const Center(
//                                   child: Text('Error loading categories'));
//                             }
//                             if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                               return const Center(
//                                   child: Text('No categories found'));
//                             }
//                             return ListView.builder(
//                               itemCount: snapshot.data!.length,
//                               itemBuilder: (context, index) {
//                                 CategoryModel categoryModel =
//                                     snapshot.data![index];
//                                 return CatergryButton(
//                                   text: categoryModel.categoryName,
//                                   onTap: () {
//                                     serviceProvider
//                                         .selectCategory(categoryModel);
//                                     Navigator.of(context).pushNamed(
//                                         '/services_list'); // Update to navigate to your page
//                                   },
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//         : Container(
//             color: const Color.fromARGB(255, 55, 54, 54),
//             child: Center(
//               child: AddButton(
//                 text: "Create Category",
//                 bgColor: Colors.white,
//                 textColor: Colors.black,
//                 onTap: () async {
//                   showLoaderDialog(context);

//                   // update isDefaultCategoryCreate to true into Firebase
//                   SalonModel salonModel = appProvider.getSalonInformation
//                       .copyWith(isDefaultCategoryCreate: true);

//                   appProvider.updateSalonInfoFirebase(
//                     context,
//                     salonModel,
//                   );

//                   InitializeDefaultCategory.instance.createDefaultCategory(
//                       context, serviceProvider, appProvider);
//                   await Future.delayed(const Duration(seconds: 3));
//                   Navigator.of(context, rootNavigator: true).pop();

//                   Routes.instance
//                       .push(widget: ServicesPages(), context: context);
//                   showMessage("Default categories are added");
//                 },
//               ),
//             ),
//           );
//   }
// }

class CatergoryDrawer extends StatefulWidget {
  const CatergoryDrawer({Key? key}) : super(key: key);

  @override
  State<CatergoryDrawer> createState() => _CatergoryDrawerState();
}

class _CatergoryDrawerState extends State<CatergoryDrawer> {
  bool isLoading = false;

  void getDate() async {
    setState(() {
      isLoading = true;
    });
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    ServiceProvider serviceProvider =
        Provider.of<ServiceProvider>(context, listen: false);
    await serviceProvider.callBackFunction(appProvider.getSalonInformation.id);
    setState(() {
      isLoading = false;
    });

    // Select the first category by default after data is loaded
    if (appProvider.getSalonInformation.isDefaultCategoryCreate) {
      if (serviceProvider.getCategoryList.isNotEmpty) {
        serviceProvider.selectCategory(serviceProvider.getCategoryList[0]);
      }
    }
  }

  @override
  void initState() {
    getDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);

    return appProvider.getSalonInformation.isDefaultCategoryCreate
        ? isLoading
            ? const Center(child: CircularProgressIndicator())
            : Material(
                child: Container(
                  width: Dimensions
                      .dimenisonNo250, // Ensure the drawer has a fixed width
                  // color: AppColor.mainColor,
                  color: const Color.fromARGB(255, 55, 54, 54),
                  // color: Color(0xFFE8E8E8),
                  child: Column(
                    children: [
                      AddButton(
                        text: "Add Category",
                        bgColor: Colors.white,
                        textColor: Colors.black,
                        iconColor: Colors.black,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AddNewCategory();
                              });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.dimenisonNo5,
                            vertical: Dimensions.dimenisonNo10),
                        child: Center(
                          child: Text(
                            'Categories',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.dimenisonNo24,
                              fontFamily: GoogleFonts.roboto().fontFamily,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(Dimensions.dimenisonNo10),
                        child: const Divider(),
                      ),
                      Expanded(
                        child: Consumer<ServiceProvider>(
                          builder: (context, value, child) {
                            if (serviceProvider.getCategoryList.isEmpty) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              if (serviceProvider.selectedCategory == null) {
                                serviceProvider.selectCategory(
                                    serviceProvider.getCategoryList.first);
                              }
                            }
                            return ListView.builder(
                              itemCount: value.getCategoryList.length,
                              itemBuilder: (context, index) {
                                CategoryModel categoryModel =
                                    value.getCategoryList[index];
                                return CatergryButton(
                                  text: categoryModel.categoryName,
                                  onTap: () {
                                    serviceProvider
                                        .selectCategory(categoryModel);
                                    Navigator.of(context).pushNamed(
                                        '/services_list'); // Update to navigate to your page
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
        : Container(
            color: const Color.fromARGB(255, 55, 54, 54),
            child: Center(
              child: AddButton(
                text: "Create Category",
                bgColor: Colors.white,
                textColor: Colors.black,
                onTap: () async {
                  showLoaderDialog(context);

                  // update isDefaultCategoryCreate to true into Firebase
                  SalonModel salonModel = appProvider.getSalonInformation
                      .copyWith(isDefaultCategoryCreate: true);

                  appProvider.updateSalonInfoFirebase(
                    context,
                    salonModel,
                  );

                  InitializeDefaultCategory.instance.createDefaultCategory(
                      context, serviceProvider, appProvider);
                  await Future.delayed(const Duration(seconds: 3));
                  Navigator.of(context, rootNavigator: true).pop();

                  Routes.instance
                      .push(widget: ServicesPages(), context: context);
                  showMessage("Default categories are added");
                },
              ),
            ),
          );
  }
}