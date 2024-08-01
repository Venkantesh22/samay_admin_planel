// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/features/custom_appbar/screen/custom_appbar.dart';
import 'package:samay_admin_plan/features/services_page/screen/category_drawer.dart';
import 'package:samay_admin_plan/features/services_page/screen/services_list.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';

class ServicesPages extends StatefulWidget {
  const ServicesPages({Key? key}) : super(key: key);

  @override
  State<ServicesPages> createState() => _ServicesPagesState();
}

class _ServicesPagesState extends State<ServicesPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(),
      ),
      body: Row(
        children: [
          // Ensure CatergoryDrawer only takes fixed width
          CatergoryDrawer(),

          // Expanded to fill remaining space
          Expanded(
            child: Navigator(
              onGenerateRoute: (settings) {
                if (settings.name == '/services_list') {
                  return MaterialPageRoute(
                    builder: (context) => ServicesList(),
                  );
                }
                return null;
              },
              initialRoute: '/',
              onUnknownRoute: (settings) => MaterialPageRoute(
                builder: (context) => ServicesList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
