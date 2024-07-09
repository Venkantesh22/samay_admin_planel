import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:samay_admin_plan/constants/theame.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/account_create_form.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/form_weektime_screen.dart';
import 'package:samay_admin_plan/features/auth/login.dart';
import 'package:samay_admin_plan/features/auth/singup.dart';
import 'package:samay_admin_plan/features/home/home_screen.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';

import 'package:samay_admin_plan/utility/dimenison.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC3090syEsOuEQzDOJEarQ0pvBCLkj9yPI",
            authDomain: "samay-mvp.firebaseapp.com",
            projectId: "samay-mvp",
            storageBucket: "samay-mvp.appspot.com",
            messagingSenderId: "401246625585",
            appId: "1:401246625585:web:1f1eeac57b1af1e87c1a10",
            measurementId: "G-CL827L80ZQ"));
  }

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeData,
        // home: Builder(
        //   builder: (context) {
        //     Dimensions.init(context);

        //     // return FormTimeSection();
        //     return AccountCreateForm();
        //     // return SingupScreen();
        //   },
        // )
        home: StreamBuilder(
          stream: FirebaseAuthHelper.instance.getAuthChange,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Dimensions.init(context);
              return const HomeScreen();
            }
            Dimensions.init(context);
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
