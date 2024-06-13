class Gym {
  Gym({
      this.id, 
      this.phoneNumber, 
      this.coverImage, 
      this.nameEn, 
      this.nameAr, 
      this.nameKu, 
      this.descriptionEn, 
      this.descriptionAr, 
      this.descriptionKu, 
      this.price, 
      this.openAt, 
      this.closeAt, 
      this.address, 
      this.createdAt, 
      this.updatedAt,});

  Gym.fromJson(dynamic json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    coverImage = json['cover_image'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    nameKu = json['name_ku'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    descriptionKu = json['description_ku'];
    price = json['price'];
    openAt = json['open_at'];
    closeAt = json['close_at'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? phoneNumber;
  String? coverImage;
  String? nameEn;
  String? nameAr;
  String? nameKu;
  String? descriptionEn;
  String? descriptionAr;
  String? descriptionKu;
  int? price;
  String? openAt;
  String? closeAt;
  String? address;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['phone_number'] = phoneNumber;
    map['cover_image'] = coverImage;
    map['name_en'] = nameEn;
    map['name_ar'] = nameAr;
    map['name_ku'] = nameKu;
    map['description_en'] = descriptionEn;
    map['description_ar'] = descriptionAr;
    map['description_ku'] = descriptionKu;
    map['price'] = price;
    map['open_at'] = openAt;
    map['close_at'] = closeAt;
    map['address'] = address;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}