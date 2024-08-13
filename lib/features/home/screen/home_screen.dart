// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart'; // For date formatting
// import 'package:samay_admin_plan/constants/router.dart';
// import 'package:samay_admin_plan/features/Account_Create_Form/screen/account_create_form.dart';
// import 'package:samay_admin_plan/features/Account_Create_Form/screen/form_weektime_screen.dart';
// import 'package:samay_admin_plan/features/custom_appbar/screen/load_appbar.dart';
// import 'package:samay_admin_plan/features/home/screen/user_info_sidebar.dart';
// import 'package:samay_admin_plan/features/home/screen/user_list.dart';
// import 'package:samay_admin_plan/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
// import 'package:samay_admin_plan/models/salon_form_models/salon_infor_model.dart';
// import 'package:samay_admin_plan/provider/app_provider.dart';
// import 'package:samay_admin_plan/features/custom_appbar/screen/custom_appbar.dart';
// import 'package:samay_admin_plan/provider/booking_provider.dart';
// import 'package:samay_admin_plan/provider/service_provider.dart';
// import 'package:samay_admin_plan/utility/dimenison.dart';

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
//     BookingProvider bookingProvider =
//         Provider.of<BookingProvider>(context, listen: false);
//     ServiceProvider serviceProvider =
//         Provider.of<ServiceProvider>(context, listen: false);
//     await appProvider.getSalonInfoFirebase();
//     await appProvider.getAdminInfoFirebase();
//     // await bookingProvider.getBookingListPro(selectDate)
//     await serviceProvider.callBackFunction(appProvider.getSalonInformation.id);

//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     AppProvider appProvider = Provider.of<AppProvider>(
//       context,
//     );

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
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Row(
//               children: [
//                 Expanded(
//                   child: UserList(
//                     salonModel: appProvider!.getSalonInformation,
//                   ),
//                 ),
//                 SizedBox(
//                   width: Dimensions.screenWidth / 3,
//                   // child: UserInfoSideBar(),
//                 )
//                 // Container(
//                 //   color: Colors.grey,
//                 //   width: Dimensions.screenWidth / 3.5,
//                 // )
//               ],
//             ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/models/user_order/user_order_model.dart';
import 'package:samay_admin_plan/features/custom_appbar/screen/load_appbar.dart';
import 'package:samay_admin_plan/features/home/screen/user_info_sidebar/screen/user_info_sidebar.dart';
import 'package:samay_admin_plan/features/home/screen/user_list/screen/user_list.dart';
import 'package:samay_admin_plan/provider/app_provider.dart';
import 'package:samay_admin_plan/features/custom_appbar/screen/custom_appbar.dart';
import 'package:samay_admin_plan/provider/booking_provider.dart';
import 'package:samay_admin_plan/provider/service_provider.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  OrderModel? selectedOrder;
  int? selectIndex;

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
    try {
      await appProvider.getSalonInfoFirebase();
      await appProvider.getAdminInfoFirebase();
      await serviceProvider
          .callBackFunction(appProvider.getSalonInformation.id);
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Function to update the selected order
  void _onBookingSelected(OrderModel order, int index) {
    setState(() {
      selectedOrder = order;
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      backgroundColor: AppColor.whileColor,
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
          ? const Center(child: CircularProgressIndicator())
          : Row(
              children: [
                // Left Side: User Booking List
                Expanded(
                  child: UserList(
                    salonModel: appProvider.getSalonInformation,
                    onBookingSelected: _onBookingSelected,
                  ),
                ),
                // Right Side: Detailed User Information
                Container(
                  decoration: const BoxDecoration(
                    color: AppColor.sideBarBgColor,
                    border: Border(
                      left: BorderSide(
                          width: 2.0,
                          color: Colors
                              .black), // Set the width and color of the border
                    ),
                  ),
                  width: Dimensions.screenWidth / 3,
                  child: selectedOrder != null
                      ? UserInfoSideBar(
                          orderModel: selectedOrder!, index: selectIndex!)
                      : const Center(
                          child: Text("Select a booking to see details"),
                        ),
                ),
              ],
            ),
    );
  }
}
