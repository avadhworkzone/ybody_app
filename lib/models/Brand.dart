import 'package:x_fitness/models/Product.dart';

class Brand {
  Brand({
      this.id, 
      this.nameEn, 
      this.nameAr, 
      this.nameKu, 
      this.descriptionEn, 
      this.descriptionAr, 
      this.descriptionKu, 
      this.coverImage, 
      this.createdAt, 
      this.updatedAt, 
      this.supplements,});

  Brand.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    nameKu = json['name_ku'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    descriptionKu = json['description_ku'];
    coverImage = json['cover_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['supplements'] != null) {
      supplements = [];
      json['supplements'].forEach((v) {
        supplements?.add(Product.fromJson(v));
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
  String? coverImage;
  String? createdAt;
  String? updatedAt;
  List<Product>? supplements;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_en'] = nameEn;
    map['name_ar'] = nameAr;
    map['name_ku'] = nameKu;
    map['description_en'] = descriptionEn;
    map['description_ar'] = descriptionAr;
    map['description_ku'] = descriptionKu;
    map['cover_image'] = coverImage;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (supplements != null) {
      map['supplements'] = supplements?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}