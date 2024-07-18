class Category {
  final String categoryName;
  final String categoryId;
  final String salonId;

  Category({
    required this.categoryName,
    required this.categoryId,
    required this.salonId,
  });

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'categoryId': categoryId,
      'salonId': salonId,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      categoryName: map['categoryName'],
      categoryId: map['categoryId'],
      salonId: map['salonId'],
    );
  }

  Category copyWith({
    String? categoryName,
    String? categoryId,
    String? salonId,
  }) {
    return Category(
      categoryName: categoryName ?? this.categoryName,
      categoryId: categoryId ?? this.categoryId,
      salonId: salonId ?? this.salonId,
    );
  }
}
