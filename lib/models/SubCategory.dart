import 'package:x_fitness/models/Product.dart';

class SubCategory {
  SubCategory({
    this.id,
    this.nameEn,
    this.nameAr,
    this.nameKu,
    this.descriptionEn,
    this.descriptionAr,
    this.descriptionKu,
    this.categoryId,
    this.coverImage,
    this.createdAt,
    this.updatedAt,
    this.products,
  });

  SubCategory.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    nameKu = json['name_ku'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    descriptionKu = json['description_ku'];
    categoryId = json['category_id'];
    coverImage = json['cover_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Product.fromJson(v));
      });
    }
  }
  int? id;
  String? nameEn;
  String? nameAr;
  String? nameKu;
  String? descriptionEn;
  String? descriptionAr;
  String? descriptionKu;
  int? categoryId;
  String? coverImage;
  String? createdAt;
  String? updatedAt;
  List<Product>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_en'] = nameEn;
    map['name_ar'] = nameAr;
    map['name_ku'] = nameKu;
    map['description_en'] = descriptionEn;
    map['description_ar'] = descriptionAr;
    map['description_ku'] = descriptionKu;
    map['category_id'] = categoryId;
    map['cover_image'] = coverImage;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
