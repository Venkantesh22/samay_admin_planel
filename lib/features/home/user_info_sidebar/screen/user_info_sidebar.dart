import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:samay_admin_plan/constants/router.dart';
import 'package:samay_admin_plan/features/edit_appointment/screen/edit_appointment.dart';
import 'package:samay_admin_plan/features/home/user_info_sidebar/screen/user_payment_screen.dart';
import 'package:samay_admin_plan/features/home/user_info_sidebar/widget/infor.dart';
import 'package:samay_admin_plan/features/home/user_info_sidebar/widget/row_of_state.dart';
import 'package:samay_admin_plan/features/home/user_info_sidebar/widget/service_tap_orderlist.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/widget/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/features/home/user_info_sidebar/widget/custom_icon_button.dart';
import 'package:samay_admin_plan/models/user_order/user_order_model.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';

class UserInfoSideBar extends StatefulWidget {
  final OrderModel orderModel;
  final int index;

  const UserInfoSideBar({
    Key? key,
    required this.orderModel,
    required this.index,
  }) : super(key: key);

  @override
  State<UserInfoSideBar> createState() => _UserInfoSideBarState();
}

class _UserInfoSideBarState extends State<UserInfoSideBar> {
  @override
  Widget build(BuildContext context) {
    // Method to launch the dialer with the phone number
    void _launchDialer(String phoneNumber) async {
      try {
        Uri dialNumber = Uri(scheme: "tel", path: phoneNumber);
        await launchUrl(dialNumber);
      } catch (e) {
        showMessage('Could not launch Mobile $e');
      }
    }

    // Method to open WhatsApp with the phone number
    Future<void> _openWhatsApp(String phoneNumber) async {
      try {
        final Uri whatsappUrl = Uri.parse('https://wa.me/$phoneNumber');
        await launchUrl(whatsappUrl);
      } catch (e) {
        showMessage('Could not launch WhatsApp $e');
      }
    }

    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 2.0,
              color: Colors.black,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.dimenisonNo16,
                right: Dimensions.dimenisonNo16,
                top: Dimensions.dimenisonNo18,
              ),
              child: Row(
                children: [
                  Text(
                    'Appointment',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.dimenisonNo18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Routes.instance.push(
                          widget: EditAppointment(
                              index: widget.index,
                              orderModer: widget.orderModel),
                          context: context);
                    },
                    icon: const Icon(
                      Icons.edit_square,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: Dimensions.dimenisonNo5),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_forever_sharp,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: Dimensions.dimenisonNo5),
            RowOfStates(index: widget.index, orderModel: widget.orderModel),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.dimenisonNo16,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green[100],
                    backgroundImage: NetworkImage(
                      widget.orderModel.userModel.image,
                    ),
                    radius: Dimensions.dimenisonNo20,
                  ),
                  SizedBox(width: Dimensions.dimenisonNo10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.orderModel.userModel.name,
                          style: TextStyle(
                            overflow: TextOverflow.clip,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.dimenisonNo16,
                          ),
                        ),
                        Text(
                          "M.no ${widget.orderModel.userModel.phone}",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: Dimensions.dimenisonNo14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.call,
                      color: Colors.black,
                      size: Dimensions.dimenisonNo30,
                    ),
                    onPressed: () {
                      // _launchDialer(orderModel.userModel.phone.toString());
                    },
                  ),
                  SizedBox(width: Dimensions.dimenisonNo10),
                  CustomIconButton(
                    iconSize: Dimensions.dimenisonNo30,
                    icon: FontAwesomeIcons.whatsapp,
                    ontap: () {
                      // _openWhatsApp(orderModel.userModel.phone.toString());
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.dimenisonNo16),
              child: Center(
                child: Text(
                  'Appointment Information',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimensions.dimenisonNo18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.dimenisonNo16),
            userInfoColumn(
              title: "Appointment Date",
              infoText:
                  "${widget.orderModel.serviceStartTime} TO ${widget.orderModel.serviceEndTime} - ${widget.orderModel.serviceDate}",
            ),
            userInfoColumn(
              title: "Appointment Time",
              infoText: widget.orderModel.serviceDate,
            ),
            userInfoColumn(
              title: "Appointment No.",
              infoText: ' 000${widget.orderModel.appointmentNo.toString()}',
            ),
            Divider(thickness: Dimensions.dimenisonNo5),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.dimenisonNo16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Service List",
                    style: TextStyle(
                      fontSize: Dimensions.dimenisonNo15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: Dimensions.dimenisonNo10),
                  ...widget.orderModel.services.map(
                    (singleService) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.dimenisonNo18_5),
                        child:
                            SingleServiceOrderList(serviceModel: singleService),
                      );
                    },
                  ).toList(),
                ],
              ),
            ),
            SizedBox(height: Dimensions.dimenisonNo10),
            Divider(),
            widget.orderModel.userNote.length >= 2
                ? userInfoColumn(
                    title: "Client Note", infoText: widget.orderModel.userNote)
                : const userInfoColumn(
                    title: "Client Note", infoText: "No user note"),
            SizedBox(height: Dimensions.dimenisonNo10),
            const Divider(thickness: 3),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.dimenisonNo16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Appointment Book Details",
                    style: TextStyle(
                      fontSize: Dimensions.dimenisonNo15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.orderModel.timeDateList.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // Display the first element separately
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Book on  ${widget.orderModel.timeDateList[0].date}  at  ${widget.orderModel.timeDateList[0].time} by ${widget.orderModel.userModel.name}",
                              style:
                                  TextStyle(fontSize: Dimensions.dimenisonNo12),
                            ),
                            // Display all remaining elements
                            SizedBox(
                              height: 4,
                            ),
                            if (widget.orderModel.timeDateList.length > 1)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...widget.orderModel.timeDateList
                                      .sublist(1)
                                      .map(
                                    (singleTimeDate) {
                                      return
                                          // singleTimeDate.updateBy == "User"
                                          //     ? Text(
                                          //         "update on ${singleTimeDate.date} at ${singleTimeDate.time} by ${singleTimeDate.updateBy}",
                                          //         style: TextStyle(
                                          //             fontSize:
                                          //                 Dimensions.dimenisonNo12),
                                          //       )
                                          //     :
                                          Text(
                                        "update on ${singleTimeDate.date} at ${singleTimeDate.time} by ${singleTimeDate.updateBy}",
                                        style: TextStyle(
                                            fontSize: Dimensions.dimenisonNo12),
                                      );
                                    },
                                  ),
                                ],
                              ),
                          ],
                        );
                      } else {
                        // Returning an empty container to avoid redundant data (first element)
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.dimenisonNo20),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.dimenisonNo16),
              width: double.infinity,
              child: CustomButtom(
                  text: "CheckOut",
                  ontap: () {
                    Routes.instance.push(
                        widget: UserSideBarPaymentScreen(
                          orderModel: widget.orderModel,
                        ),
                        context: context);
                  },
                  buttonColor: AppColor.buttonColor),
            ),
            SizedBox(
              height: Dimensions.dimenisonNo20,
            ),
          ],
        ),
      ),
    );
  }
}
