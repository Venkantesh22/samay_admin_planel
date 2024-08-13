import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/constants/router.dart';
import 'package:samay_admin_plan/features/home/screen/home_screen.dart';
import 'package:samay_admin_plan/features/home/widget/state_text.dart';
import 'package:samay_admin_plan/models/user_order/user_order_model.dart';
import 'package:samay_admin_plan/provider/booking_provider.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';

class RowOfStates extends StatelessWidget {
  final int index;
  final OrderModel orderModel;
  const RowOfStates({
    Key? key,
    required this.index,
    required this.orderModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookingProvider bookingProvider = Provider.of<BookingProvider>(context);

    return orderModel.status == "Pending"
        ? Padding(
            padding: EdgeInsets.only(
              top: Dimensions.dimenisonNo16,
              left: Dimensions.dimenisonNo16,
              right: Dimensions.dimenisonNo16,
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Current State",
                      style: TextStyle(fontSize: Dimensions.dimenisonNo14),
                    ),
                    CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: StateText(status: orderModel.status)),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      "Update State",
                      style: TextStyle(fontSize: Dimensions.dimenisonNo14),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (orderModel.status == "Pending") {
                          OrderModel orderUpdate =
                              orderModel.copyWith(status: "Confirmed");
                          bookingProvider.updateAppointment(
                            index,
                            orderUpdate.userModel.id,
                            orderModel.orderId,
                            orderUpdate,
                          );
                          Routes.instance
                              .push(widget: HomeScreen(), context: context);
                          showMessage(
                              "Booking of ${orderUpdate.userModel.name} update to Confirmed");
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.checkmark_alt_circle,
                            size: Dimensions.dimenisonNo18,
                            color: AppColor.buttonColor,
                          ),
                          SizedBox(width: Dimensions.dimenisonNo5),
                          Text(
                            "Confirmed",
                            style: GoogleFonts.roboto(
                              fontSize: Dimensions.dimenisonNo16,
                              color: AppColor.buttonColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider()
              ],
            ),
          )
        : orderModel.status == "Confirmed"
            ? Padding(
                padding: EdgeInsets.only(
                  top: Dimensions.dimenisonNo16,
                  left: Dimensions.dimenisonNo16,
                  right: Dimensions.dimenisonNo16,
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Current State",
                          style: TextStyle(fontSize: Dimensions.dimenisonNo14),
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.checkmark_alt_circle,
                                size: Dimensions.dimenisonNo18,
                                color: AppColor.buttonColor,
                              ),
                              SizedBox(width: Dimensions.dimenisonNo5),
                              Text(
                                orderModel.status,
                                style: GoogleFonts.roboto(
                                  fontSize: Dimensions.dimenisonNo16,
                                  color: AppColor.buttonColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // StateText(status: orderModel.status)),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          "Update State",
                          style: TextStyle(fontSize: Dimensions.dimenisonNo14),
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            OrderModel orderUpdate =
                                orderModel.copyWith(status: "InProcces");
                            bookingProvider.updateAppointment(
                              index,
                              orderUpdate.userModel.id,
                              orderModel.orderId,
                              orderUpdate,
                            );
                            Routes.instance
                                .push(widget: HomeScreen(), context: context);
                            showMessage(
                                "Booking of ${orderUpdate.userModel.name} update to InProcess");
                          },
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.scissors,
                                size: Dimensions.dimenisonNo14,
                              ),
                              SizedBox(width: Dimensions.dimenisonNo10),
                              Text(
                                "InProcces",
                                style: GoogleFonts.roboto(
                                  fontSize: Dimensions.dimenisonNo16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider()
                  ],
                ),
              )
            : orderModel.status == "InProcces"
                ? Padding(
                    padding: EdgeInsets.only(
                      top: Dimensions.dimenisonNo16,
                      left: Dimensions.dimenisonNo16,
                      right: Dimensions.dimenisonNo16,
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Current State",
                              style:
                                  TextStyle(fontSize: Dimensions.dimenisonNo14),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.scissors,
                                    size: Dimensions.dimenisonNo14,
                                  ),
                                  SizedBox(width: Dimensions.dimenisonNo10),
                                  Text(
                                    orderModel.status,
                                    style: GoogleFonts.roboto(
                                      fontSize: Dimensions.dimenisonNo16,
                                      color: AppColor.buttonColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              "Update State",
                              style:
                                  TextStyle(fontSize: Dimensions.dimenisonNo14),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                OrderModel orderUpdate =
                                    orderModel.copyWith(status: "Completed");
                                bookingProvider.updateAppointment(
                                  index,
                                  orderUpdate.userModel.id,
                                  orderModel.orderId,
                                  orderUpdate,
                                );
                                Routes.instance.push(
                                    widget: HomeScreen(), context: context);
                                showMessage(
                                    "Booking of ${orderUpdate.userModel.name} update to InProcess");
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.checkmark_alt_circle,
                                    size: Dimensions.dimenisonNo18,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(width: Dimensions.dimenisonNo5),
                                  Text(
                                    "Completed",
                                    style: GoogleFonts.roboto(
                                      fontSize: Dimensions.dimenisonNo16,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider()
                      ],
                    ),
                  )
                : Container(
                    height: Dimensions.dimenisonNo60,
                    padding: EdgeInsets.only(
                      left: Dimensions.dimenisonNo16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Current State",
                          style: TextStyle(fontSize: Dimensions.dimenisonNo14),
                        ),
                        SizedBox(
                          height: Dimensions.dimenisonNo10,
                        ),
                        StateText(status: orderModel.status),
                      ],
                    ),
                  );
  }
}
