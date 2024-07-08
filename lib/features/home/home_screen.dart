// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';
import 'package:samay_admin_plan/widget/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.getAdminInfoFirebase();
    getCategoruList();
    super.initState();
  }

  void getCategoruList() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Hii"),
            ElevatedButton(
              onPressed: () {
                FirebaseAuthHelper.instance.signOut();
              },
              child: Text("SingOut"),
            )
          ],
        ),
      ),
    );
  }
}
