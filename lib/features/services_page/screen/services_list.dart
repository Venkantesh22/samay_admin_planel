import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/constants/router.dart';
import 'package:samay_admin_plan/features/popup/edit_category.dart';
import 'package:samay_admin_plan/features/service%20view/screen/add_service_form.dart';
import 'package:samay_admin_plan/features/service%20view/screen/single_service_tap.dart';
import 'package:samay_admin_plan/models/service_model/service_model.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';
import 'package:samay_admin_plan/provider/service_provider.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';
import 'package:samay_admin_plan/widget/add_button.dart';

class ServicesList extends StatefulWidget {
  const ServicesList({Key? key}) : super(key: key);

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  @override
  Widget build(BuildContext context) {
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    AppProvider appProvider = Provider.of<AppProvider>(context);
    final selectedCategory = serviceProvider.selectedCategory;

    return Scaffold(
      body: serviceProvider.getCategoryList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(Dimensions.dimenisonNo10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            selectedCategory?.categoryName ?? "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.dimenisonNo30,
                              fontFamily: GoogleFonts.roboto().fontFamily,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.15,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return EditCategoryPopup(
                                      categoryModel: selectedCategory,
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.edit_square,
                              color: Colors.black,
                            ),
                          ),

                          // Delete icon for delete category
                          IconButton(
                            onPressed: () async {
                              try {
                                showLoaderDialog(context);
                                serviceProvider
                                    .deleteSingleCategoryPro(selectedCategory!);
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                // Update Drawer
                                await serviceProvider.callBackFunction(
                                    appProvider.getSalonInformation.id);

                                // Select the first category by default after data is loaded
                                if (serviceProvider
                                    .getCategoryList.isNotEmpty) {
                                  serviceProvider.selectCategory(
                                      serviceProvider.getCategoryList[0]);
                                }
                                // help to reload the page or Navigator to same page
                                Navigator(
                                  onGenerateRoute: (settings) {
                                    if (settings.name == '/services_list') {
                                      return MaterialPageRoute(
                                        builder: (context) =>
                                            const ServicesList(),
                                      );
                                    }
                                    return null;
                                  },
                                  initialRoute: '/',
                                  onUnknownRoute: (settings) =>
                                      MaterialPageRoute(
                                    builder: (context) => const ServicesList(),
                                  ),
                                );

                                showMessage(
                                    "Successfully delete ${selectedCategory.categoryName}");
                              } catch (e) {
                                showMessage(
                                    "Error not delete ${selectedCategory!.categoryName}");
                              }
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                          AddButton(
                              text: "Add Services",
                              onTap: () {
                                Routes.instance.push(
                                    widget: AddServiceForm(
                                        categoryModel: selectedCategory!),
                                    context: context);
                              })
                        ],
                      ),
                      Divider()
                    ],
                  ),

                  //  Services List
                  Expanded(
                      child: StreamBuilder<List<ServiceModel>>(
                    stream: serviceProvider.getServicesListFirebase(
                        appProvider.getSalonInformation.id,
                        selectedCategory!.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Error loading Service'));
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No Service found'));
                      }
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            ServiceModel serviceModel = snapshot.data![index];
                            return SingleServiceTap(
                              serviceModel: serviceModel,
                              categoryModel: selectedCategory,
                              index: index,
                            );
                          });
                    },
                  )),
                ],
              ),
            ),
    );
  }
}
