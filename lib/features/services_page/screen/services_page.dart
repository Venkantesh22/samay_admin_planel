// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:samay_admin_plan/features/custom_appbar/screen/custom_appbar.dart';
import 'package:samay_admin_plan/features/services_page/screen/category_drawer.dart';
import 'package:samay_admin_plan/features/services_page/screen/services_list.dart';

class ServicesPages extends StatefulWidget {
  ServicesPages({Key? key}) : super(key: key);

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

// import 'package:flutter/material.dart';
// import 'package:samay_admin_plan/features/custom_appbar/custom_appbar.dart';
// import 'package:samay_admin_plan/features/services_page/screen/category_drawer.dart';
// import 'package:samay_admin_plan/features/services_page/screen/services_list.dart';

// class ServicesPages extends StatefulWidget {
//   ServicesPages({Key? key}) : super(key: key);

//   @override
//   State<ServicesPages> createState() => _ServicesPagesState();
// }

// class _ServicesPagesState extends State<ServicesPages> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(60.0),
//         child: CustomAppBar(),
//       ),
//       body: Row(
//         children: [
//           // Ensure CatergoryDrawer only takes fixed width
//           CatergoryDrawer(),

//           Expanded(
//             child: ServicesList(categoryName: "hii"),
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:samay_admin_plan/features/custom_appbar/custom_appbar.dart';
// import 'package:samay_admin_plan/features/services_page/screen/category_drawer.dart';
// import 'package:samay_admin_plan/provider/service_provider.dart';

// class ServicesPages extends StatefulWidget {
//   ServicesPages({Key? key}) : super(key: key);

//   @override
//   State<ServicesPages> createState() => _ServicesPagesState();
// }

// class _ServicesPagesState extends State<ServicesPages> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(60.0),
//         child: CustomAppBar(),
//       ),
      // appBar: AppBar(
      //   backgroundColor: AppColor.mainColor,
      //   title: Center(
      //     child: Text(
      //       '${GlobalVariable.salon} Profile Details',
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontSize: Dimensions.dimenisonNo30,
      //         fontFamily: GoogleFonts.roboto().fontFamily,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 0.15,
      //       ),
      //     ),
      //   ),
      // ),
//       body: Row(
//         children: [
//           CatergoryDrawer(),
        //  // Expanded(child: ServicesList(categoryName: "HireCut")),
//           Expanded(
//             child: Container(
//               color: Colors.white,
//               child: Center(child: Text('Services List')),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (context) => ServiceProvider(),
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: const PreferredSize(
//             preferredSize: Size.fromHeight(60.0),
//             child: CustomAppBar(),
//           ),
//           body: Row(
//             children: [
//               CatergoryDrawer(),
//               Expanded(
//                 child: Text(
//                   "data",
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

