// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:samay_admin_plan/constants/router.dart';
// import 'package:samay_admin_plan/features/Account_Create_Form/screen/account_create_form.dart';
// import 'package:samay_admin_plan/features/Account_Create_Form/screen/form_weektime_screen.dart';
// import 'package:samay_admin_plan/features/custom_appbar/screen/load_appbar.dart';
// import 'package:samay_admin_plan/features/home/ex.dart';
// import 'package:samay_admin_plan/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
// import 'package:samay_admin_plan/provider/app_provider.dart';
// import 'package:samay_admin_plan/features/custom_appbar/screen/custom_appbar.dart';
// import 'package:samay_admin_plan/provider/service_provider.dart';
// import 'package:samay_admin_plan/utility/dimenison.dart';
// import 'package:samay_admin_plan/widget/add_button.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoading = false;
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   // Fetch data needed for the screen
//   void getData() async {
//     setState(() {
//       isLoading = true;
//     });
//     AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
//     ServiceProvider serviceProvider =
//         Provider.of<ServiceProvider>(context, listen: false);
//     await appProvider.getSalonInfoFirebase();
//     await appProvider.getAdminInfoFirebase();
//     await serviceProvider.callBackFunction(appProvider.getSalonInformation.id);
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: isLoading
//           ? const PreferredSize(
//               preferredSize: Size.fromHeight(60.0),
//               child: LoadAppBar(),
//             )
//           : const PreferredSize(
//               preferredSize: Size.fromHeight(60.0),
//               child: CustomAppBar(),
//             ),
//       body: Column(
//         children: [
//           Container(
//             // height: 50,
//             padding: EdgeInsets.only(
//               left: Dimensions.dimenisonNo16,
//               right: Dimensions.dimenisonNo16,
//               top: Dimensions.dimenisonNo10,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(width: Dimensions.dimenisonNo20),
//                 Text(
//                   'Today',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: Dimensions.dimenisonNo16,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 SizedBox(
//                   width: Dimensions.dimenisonNo12,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF4B4B4B),
//                     borderRadius:
//                         BorderRadius.circular(Dimensions.dimenisonNo5),
//                   ),
//                   child: const Icon(
//                     Icons.arrow_left_sharp,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(
//                   width: Dimensions.dimenisonNo10,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF4B4B4B),
//                     borderRadius:
//                         BorderRadius.circular(Dimensions.dimenisonNo5),
//                   ),
//                   child: const Icon(
//                     Icons.arrow_right_sharp,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(
//                   width: Dimensions.dimenisonNo12,
//                 ),
//                 Text(
//                   '1 April',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: Dimensions.dimenisonNo16,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 const Icon(
//                   Icons.arrow_drop_down,
//                 ),
//                 Spacer(),
//                 AddButton(text: "Add Appointment", onTap: () {})
//               ],
//             ),
//           ),
//           Divider(
//             color: Colors.black,
//           ),
//           Padding(
//             padding: EdgeInsets.all(Dimensions.dimenisonNo16),
//           )
//         ],
//       ),

//     );
//   }
// }

// Center(
//   child: Column(
//     children: [
//       ElevatedButton(
//         onPressed: () {
//           Routes.instance
//               .push(widget: const AccountCreateForm(), context: context);
//         },
//         child: const Text("Hi"),
//       ),
//       ElevatedButton(
//         onPressed: () {
//           FirebaseAuthHelper.instance.signOut();
//         },
//         child: const Text("Signout"),
//       ),
//       ElevatedButton(
//         onPressed: () {
//           Routes.instance.push(widget: MyEx(), context: context);
//         },
//         child: const Text("MY ex"),
//       ),
//       ElevatedButton(
//         onPressed: () {
//           Routes.instance
//               .push(widget: FormTimeSection(), context: context);
//         },
//         child: const Text("FormTimeSection"),
//       ),
//       AddButton(
//         text: "Add Category",
//         onTap: () {},
//       ),
//     ],
//   ),
// ),

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:samay_admin_plan/constants/router.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/screen/account_create_form.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/screen/form_weektime_screen.dart';
import 'package:samay_admin_plan/features/custom_appbar/screen/load_appbar.dart';
import 'package:samay_admin_plan/features/home/screen/user_list.dart';

import 'package:samay_admin_plan/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:samay_admin_plan/models/salon_form_models/salon_infor_model.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';
import 'package:samay_admin_plan/features/custom_appbar/screen/custom_appbar.dart';
import 'package:samay_admin_plan/provider/booking_provider.dart';
import 'package:samay_admin_plan/provider/service_provider.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  // Fetch data needed for the screen
  void getData() async {
    setState(() {
      isLoading = true;
    });
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    BookingProvider bookingProvider =
        Provider.of<BookingProvider>(context, listen: false);
    ServiceProvider serviceProvider =
        Provider.of<ServiceProvider>(context, listen: false);
    await appProvider.getSalonInfoFirebase();
    await appProvider.getAdminInfoFirebase();
    // await bookingProvider.getBookingListPro(selectDate)
    await serviceProvider.callBackFunction(appProvider.getSalonInformation.id);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );

    return Scaffold(
      appBar: isLoading
          ? const PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: LoadAppBar(),
            )
          : const PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: CustomAppBar(),
            ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Row(
              children: [
                Expanded(
                    child: UserList(
                  salonModel: appProvider!.getSalonInformation,
                )),
                Container(
                  color: Colors.grey,
                  width: Dimensions.screenWidth / 3.5,
                )
              ],
            ),
    );
  }
}
