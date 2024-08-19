import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/constants/theame.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/screen/account_create_form.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/screen/form_weektime_screen.dart';
import 'package:samay_admin_plan/features/add_new_appointment/screen/add_new_appointment.dart';
import 'package:samay_admin_plan/features/auth/login.dart';
import 'package:samay_admin_plan/features/home/main_home/home_screen.dart';
import 'package:samay_admin_plan/features/home/user_info_sidebar/screen/user_payment_screen.dart';
import 'package:samay_admin_plan/features/service%20view/screen/add_service_form.dart';
import 'package:samay_admin_plan/features/services_page/screen/services_list.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';
import 'package:samay_admin_plan/provider/booking_provider.dart';
import 'package:samay_admin_plan/provider/service_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => ServiceProvider()),
        ChangeNotifierProvider(create: (context) => BookingProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themeData,
          // home: Builder(
          //   builder: (context) {
          //     Dimensions.init(context);
          //     return AddNewAppointment();
          //     // return AddServiceForm();
          //     // return ServicesPages();
          //     // return FormTimeSection();
          //     // return SingupScreen();
          //     // return AccountCreateForm();
          //     // return SingupScreen();
          //   },
          // )
          home: StreamBuilder(
            stream: FirebaseAuthHelper.instance.getAuthChange,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Dimensions.init(context);
                return const HomeScreen();
                // return ServicesPages();
              }
              Dimensions.init(context);
              return const LoginScreen();
            },
          ),
          // routes: {
          //   '/services_list': (context) => ServicesList(),
          // },
        );
      },
    );
  }
}
