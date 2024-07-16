import 'dart:convert';

// SalonModel salonModelFromJson(String str) =>
//     SalonModel.fromJson(json.decode(str));

// String salonModelToJson(SalonModel data) => json.encode(data.toJson());

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
    this.instagram = null,
    this.facebook = null,
    this.googleMap = null,
    this.linked = null,
    this.image = null,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
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
  String? instagram;
  String? facebook;
  String? googleMap;
  String? linked;
  String? image;
  String? monday;
  String? tuesday;
  String? wednesday;
  String? thursday;
  String? friday;
  String? saturday;
  String? sunday;

  factory SalonModel.fromJson(
    Map<String, dynamic> json,
    String? id,
  ) =>
      SalonModel(
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
        monday: json['monday'],
        tuesday: json['tuesday'],
        wednesday: json['wednesday'],
        thursday: json['thursday'],
        friday: json['friday'],
        saturday: json['saturday'],
        sunday: json['sunday'],
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
        'monday': monday,
        'tuesday': tuesday,
        'wednesday': wednesday,
        'thursday': thursday,
        'friday': friday,
        'saturday': saturday,
        'sunday': sunday,
      };

  SalonModel copyWith({
    String? name,
    String? email,
    int? number,
    int? whatApp,
    String? salonType,
    String? description,
    String? openTime,
    String? closeTime,
    String? address,
    String? instagram,
    String? facebook,
    String? googleMap,
    String? linked,
    String? image,
    String? monday,
    String? tuesday,
    String? wednesday,
    String? thursday,
    String? friday,
    String? saturday,
    String? sunday,
  }) {
    return SalonModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      number: number ?? this.number,
      whatApp: whatApp ?? this.whatApp,
      salonType: salonType ?? this.salonType,
      description: description ?? this.description,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime ?? this.closeTime,
      address: address ?? this.address,
      instagram: instagram ?? this.instagram,
      facebook: facebook ?? this.facebook,
      googleMap: googleMap ?? this.googleMap,
      linked: linked ?? this.linked,
      image: image ?? this.image,
      // name: name,
      // email: email,
      // number: number,
      // whatApp: whatApp,
      // salonType: salonType,
      // description: description,
      // openTime: openTime,
      // closeTime: closeTime,
      // address: address,
      // instagram: instagram,
      // facebook: facebook,
      // googleMap: googleMap,
      // linked: linked,
      // image: image,
      monday: monday ?? this.monday,
      tuesday: tuesday ?? this.tuesday,
      wednesday: wednesday ?? this.wednesday,
      thursday: thursday ?? this.thursday,
      friday: friday ?? this.friday,
      saturday: saturday ?? this.saturday,
      sunday: sunday ?? this.sunday,
    );
  }
}