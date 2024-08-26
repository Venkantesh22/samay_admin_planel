import 'package:samay_admin_plan/models/salon_form_models/salon_infor_model.dart';
import 'package:samay_admin_plan/models/service_model/service_model.dart';
import 'package:samay_admin_plan/models/timestamped_model/date_time_model.dart';
import 'package:samay_admin_plan/models/user_model/user_model.dart';

class OrderModel {
  final String orderId;
  final int appointmentNo;
  final List<ServiceModel> services;
  final String status;
  final double totalPrice;
  final String payment;
  final String serviceDuration;
  final String serviceDate;
  final String serviceStartTime;
  final String serviceEndTime;
  final String userNote;
  final SalonModel salonModel;
  final UserModel userModel;
  final List<TimeDateModel> timeDateList; // New field added
  final bool isUpdate;
  OrderModel({
    required this.orderId,
    required this.appointmentNo,
    required this.services,
    required this.status,
    required this.totalPrice,
    required this.payment,
    required this.serviceDuration,
    required this.serviceDate,
    required this.serviceStartTime,
    required this.serviceEndTime,
    required this.userNote,
    required this.salonModel,
    required this.userModel,
    required this.timeDateList, // Initialize new field
    this.isUpdate = false,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        orderId: json['orderId'] ?? '', // Default to empty string if null
        appointmentNo: (json['appointmentNo'] ?? '').toInt(),
        services: (json['services'] as List)
                .map((item) => ServiceModel.fromJson(item))
                .toList() ??
            [],
        status: json['status'] ?? 'Pending', // Default to 'Pending' if null
        totalPrice:
            (json['totalPrice'] ?? 0.0).toDouble(), // Default to 0.0 if null
        payment: json['payment'] ?? 'Unknown', // Default to 'Unknown' if null
        serviceDuration:
            json['serviceDuration'] ?? '0h 0m', // Default to '0h 0m' if null
        serviceDate: json['serviceDate'] ??
            'Unknown Date', // Default to 'Unknown Date' if null
        serviceStartTime: json['serviceStartTime'] ??
            'Unknown Start Time', // Default to 'Unknown Start Time' if null
        serviceEndTime: json['serviceEndTime'] ??
            'Unknown End Time', // Default to 'Unknown End Time' if null
        userNote: json['userNote'] ?? '', // Default to empty string if null

        salonModel:
            SalonModel.fromJson(json['salonModel'], json['salonModel']['id']),
        userModel: UserModel.fromJson(json['userModel']),
        timeDateList: (json['timeDateList'] as List)
                .map((item) => TimeDateModel.fromJson(item))
                .toList() ??
            [], // Parse the list of TimeDateModel
        isUpdate: json['isUpdate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'appointmentNo': appointmentNo,
      'services': services.map((e) => e.toJson()).toList(),
      'status': status,
      'totalPrice': totalPrice,
      'payment': payment,
      'serviceDuration': serviceDuration,
      'serviceDate': serviceDate,
      'serviceStartTime': serviceStartTime,
      'serviceEndTime': serviceEndTime,
      'userNote': userNote,
      'salonModel': salonModel.toJson(),
      'userModel': userModel.toJson(),
      'timeDateList': timeDateList
          .map((e) => e.toJson())
          .toList(), // Serialize the list of TimeDateModel
      "isUpdate": isUpdate,
    };
  }

  OrderModel copyWith({
    List<ServiceModel>? services,
    UserModel? userModel,
    String? status,
    double? totalPrice,
    String? payment,
    String? serviceDuration,
    String? serviceDate,
    String? serviceStartTime,
    String? serviceEndTime,
    String? userNote,
    List<TimeDateModel>? timeDateList, // New field in copyWith method
    bool? isUpdate,
  }) {
    return OrderModel(
      orderId: orderId,
      appointmentNo: appointmentNo ?? this.appointmentNo,
      services: services ?? this.services,
      status: status ?? this.status,
      totalPrice: totalPrice ?? this.totalPrice,
      payment: payment ?? this.payment,
      serviceDuration: serviceDuration ?? this.serviceDuration,
      serviceDate: serviceDate ?? this.serviceDate,
      serviceStartTime: serviceStartTime ?? this.serviceStartTime,
      serviceEndTime: serviceEndTime ?? this.serviceEndTime,
      userNote: userNote ?? this.userNote,

      salonModel: salonModel,
      userModel: userModel ?? this.userModel,
      timeDateList:
          timeDateList ?? this.timeDateList, // Updated with the new field
      isUpdate: isUpdate ?? this.isUpdate,
    );
  }
}
