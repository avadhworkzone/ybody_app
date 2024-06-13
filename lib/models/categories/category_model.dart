class Category {
  final int id;
  final String nameEn;
  final String nameAr;
  final String nameKu;
  final String descriptionEn;
  final String descriptionAr;
  final String descriptionKu;
  final String coverImage;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.nameKu,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.descriptionKu,
    required this.coverImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      nameKu: json['name_ku'],
      descriptionEn: json['description_en'],
      descriptionAr: json['description_ar'],
      descriptionKu: json['description_ku'],
      coverImage: json['cover_image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
