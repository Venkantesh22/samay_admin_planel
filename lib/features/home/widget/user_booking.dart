import 'package:flutter/material.dart';
import 'package:samay_admin_plan/features/home/widget/state_text.dart';
import 'package:samay_admin_plan/models/user_order/user_order_model.dart';
import 'package:samay_admin_plan/utility/color.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';

class UserBookingTap extends StatelessWidget {
  final OrderModel orderModel;
  const UserBookingTap({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: Dimensions.dimenisonNo12,
        left: Dimensions.dimenisonNo12,
        right: Dimensions.dimenisonNo12,
      ),
      padding: EdgeInsets.all(Dimensions.dimenisonNo8),
      height: Dimensions.dimenisonNo60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.circular(Dimensions.dimenisonNo12),
      ),
      child: Row(
        children: [
          SizedBox(width: Dimensions.dimenisonNo16),
          CircleAvatar(
            radius: Dimensions.dimenisonNo20,
            backgroundColor: Colors.green[100],
            backgroundImage: NetworkImage(
              orderModel.userModel.image,
            ),
          ),
          SizedBox(width: Dimensions.dimenisonNo20),
          SizedBox(
            width: Dimensions.dimenisonNo200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderModel.userModel.name,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.dimenisonNo16,
                  ),
                ),
                Text(
                  orderModel.userModel.phone.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.dimenisonNo14,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: Text(
              '${orderModel.serviceStartTime} To ${orderModel.serviceEndTime}',
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.dimenisonNo14,
              ),
            ),
          ),
          const Spacer(),
          StateText(status: orderModel.status),
          SizedBox(width: Dimensions.dimenisonNo16),
        ],
      ),
    );
  }
}
