class CategoryModel {
  final String id;
  final String categoryName;

  final String salonId;

  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.salonId,
  });

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'id': id,
      'salonId': salonId,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryName: map['categoryName'],
      id: map['id'],
      salonId: map['salonId'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "salonId": salonId,
      };

  CategoryModel copyWith({
    String? categoryName,
    String? id,
    String? salonId,
  }) {
    return CategoryModel(
      categoryName: categoryName ?? this.categoryName,
      id: id ?? this.id,
      salonId: salonId ?? this.salonId,
    );
  }
}
