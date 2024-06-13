import 'Parts.dart';

class Muscle {
  Muscle({
      this.id, 
      this.titleEn, 
      this.titleAr, 
      this.titleKu, 
      this.descriptionEn, 
      this.descriptionAr, 
      this.descriptionKu, 
      this.coverImage, 
      this.createdAt, 
      this.updatedAt, 
      this.parts,});

  Muscle.fromJson(dynamic json) {
    id = json['id'];
    titleEn = json['title_en'];
    titleAr = json['title_ar'];
    titleKu = json['title_ku'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    descriptionKu = json['description_ku'];
    coverImage = json['cover_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['parts'] != null) {
      parts = [];
      json['parts'].forEach((v) {
        parts?.add(Parts.fromJson(v));
      });
    }
  }
  int? id;
  String? titleEn;
  String? titleAr;
  String? titleKu;
  String? descriptionEn;
  String? descriptionAr;
  String? descriptionKu;
  String? coverImage;
  String? createdAt;
  String? updatedAt;
  List<Parts>? parts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title_en'] = titleEn;
    map['title_ar'] = titleAr;
    map['title_ku'] = titleKu;
    map['description_en'] = descriptionEn;
    map['description_ar'] = descriptionAr;
    map['description_ku'] = descriptionKu;
    map['cover_image'] = coverImage;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (parts != null) {
      map['parts'] = parts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}