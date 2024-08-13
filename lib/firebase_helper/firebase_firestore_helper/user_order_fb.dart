import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:samay_admin_plan/models/user_order/user_order_model.dart';

class UserBookingFB {
  static UserBookingFB instance = UserBookingFB();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Get User Appointment by Date
  Future<List<OrderModel>> getUserBookingListFB(String selectDate) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore
              .collectionGroup('order')
              .where('serviceDate', isEqualTo: selectDate)
              .get();

      List<OrderModel> bookingList =
          querySnapshot.docs.map((e) => OrderModel.fromJson(e.data())).toList();

      return bookingList;
    } catch (e) {
      print("Error fetching booking list: $e");
      return [];
    }
  }

// Update Appointment by Id
  Future<void> updateAppointmentFB(
      String userId, appointmentId, OrderModel orderModel) async {
    await _firebaseFirestore
        .collection('UserOrder')
        .doc(userId)
        .collection('order')
        .doc(appointmentId)
        .update(orderModel.toJson());
  }
}
