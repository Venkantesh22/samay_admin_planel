import 'dart:convert';

SalonModel salonModelFromJson(String str) =>
    SalonModel.fromJson(json.decode(str));

String salonModelToJson(SalonModel data) => json.encode(data.toJson());

class SalonModel {
  SalonModel({
    required this.id,
    required this.name,
    required this.email,
    required this.number,
    required this.whatApp,
    required this.salonType,
    required this.description,
    required this.openTime,
    required this.closeTime,
    required this.address,
    this.instagram = "",
    this.facebook = "",
    this.googleMap = "",
    this.linked = "",
    this.image = "",
  });

  String id;
  String name;
  String email;
  int number;
  int whatApp;
  String salonType;
  String description;
  String openTime;
  String closeTime;
  String address;
  String instagram;
  String facebook;
  String googleMap;
  String linked;
  String? image;

  factory SalonModel.fromJson(Map<String, dynamic> json) => SalonModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        number:
            json["number"] != null ? int.parse(json["number"].toString()) : 0,
        whatApp:
            json["whatApp"] != null ? int.parse(json["whatApp"].toString()) : 0,
        salonType: json["salonType"],
        description: json["description"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        address: json["address"],
        instagram: json["instagram"],
        facebook: json["facebook"],
        googleMap: json["googleMap"],
        linked: json["linked"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "number": number,
        "whatApp": whatApp,
        "salonType": salonType,
        "description": description,
        "openTime": openTime,
        "closeTime": closeTime,
        "address": address,
        "instagram": instagram,
        "facebook": facebook,
        "googleMap": googleMap,
        "linked": linked,
        "image": image,
      };

  // SalonModel copyWith({
  //   String? name,
  //   image,
  //   email,

  //   number,
  // }) =>
  // SalonModel(
  //   id: id,
  //   name: name ?? this.name,
  //   email: email ?? this.email,
  //   image: image ?? this.image,

  //   number: number ?? this.number,
  // );
}
