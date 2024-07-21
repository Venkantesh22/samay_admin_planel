import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/constants/router.dart';
import 'package:samay_admin_plan/features/services_page/screen/add_service_form.dart';
import 'package:samay_admin_plan/features/services_page/widget/single_service_tap.dart';
import 'package:samay_admin_plan/models/service%20model/service_model.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';
import 'package:samay_admin_plan/provider/service_provider.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';
import 'package:samay_admin_plan/widget/add_button.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    AppProvider appProvider = Provider.of<AppProvider>(context);
    final selectedCategory = serviceProvider.selectedCategory;

    return Scaffold(
      body: serviceProvider.getCategoryList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(Dimensions.dimenisonNo12),
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
                            return SingleServiceTap(serviceModel: serviceModel);
                          });
                    },
                  )),
                ],
              ),
            ),
    );
  }
}
