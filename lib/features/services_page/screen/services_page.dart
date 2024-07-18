import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/features/custom_appbar/custom_appbar.dart';
import 'package:samay_admin_plan/features/services_page/widget/category_list.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';
import 'package:samay_admin_plan/provider/service_provider.dart';

class ServicesPages extends StatefulWidget {
  ServicesPages({Key? key}) : super(key: key);

  @override
  State<ServicesPages> createState() => _ServicesPagesState();
}

class _ServicesPagesState extends State<ServicesPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(),
      ),
      body: Row(
        children: [
          CatergoryList(),
          Expanded(
            child: Consumer<ServiceProvider>(
              builder: (context, serviceProvider, _) {
                return serviceProvider.currentPage;
              },
            ),
          ),
        ],
      ),
    );
  }
}
