class ServiceModel {
  final String id;
  final String salonId;
  final String categoryId;
  final String servicesName;
  final double price;
  final double hours;
  final double minutes;
  final String description;

  ServiceModel({
    required this.id,
    required this.salonId,
    required this.categoryId,
    required this.servicesName,
    required this.price,
    required this.hours,
    required this.minutes,
    required this.description,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      salonId: json['salonId'],
      categoryId: json['categoryId'],
      id: json['id'],
      servicesName: json['servicesName'],
      price: json['price'],
      hours: json['hours'],
      minutes: json['minutes'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'salonId': salonId,
      'categoryId': categoryId,
      'id': id,
      'servicesName': servicesName,
      'price': price,
      'hours': hours,
      'minutes': minutes,
      'description': description,
    };
  }

  ServiceModel copyWith({
    // String? salonId,
    // String? categoryId,
    // String? id,
    String? servicesName,
    double? price,
    double? hours,
    double? minutes,
    String? description,
  }) {
    return ServiceModel(
      salonId: salonId,
      categoryId: categoryId,
      id: id,
      servicesName: servicesName ?? this.servicesName,
      price: price ?? this.price,
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
      description: description ?? this.description,
    );
  }
}
