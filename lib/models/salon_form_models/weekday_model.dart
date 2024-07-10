import 'dart:convert';

WeekdayModel weekDayModelFromJson(String str) =>
    WeekdayModel.fromJson(json.decode(str));

String weekDayModelToJson(WeekdayModel data) => json.encode(data.toJson());

class WeekdayModel {
  String id;
  String monday;
  String tuesday;
  String wednesday;
  String thursday;
  String friday;
  String saturday;
  String sunday;

  WeekdayModel({
    required this.id,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  factory WeekdayModel.fromJson(Map<String, dynamic> json) {
    return WeekdayModel(
      id: json['id'],
      monday: json['monday'],
      tuesday: json['tuesday'],
      wednesday: json['wednesday'],
      thursday: json['thursday'],
      friday: json['friday'],
      saturday: json['saturday'],
      sunday: json['sunday'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'sunday': sunday,
    };
  }

  // WeekdayModel copyWith({
  //   String? name,
  //   image,
  //   email,
  //   password,
  //   number,
  // }) =>
  // WeekdayModel(
  //   id: id,
  //   name: name ?? this.name,
  //   email: email ?? this.email,
  //   image: image ?? this.image,
  //   password: password ?? this.password,
  //   number: number ?? this.number,
  // );
}
