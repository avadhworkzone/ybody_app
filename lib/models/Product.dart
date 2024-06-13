class Product {
  Product({
       this.id,
       this.nameEn,
       this.nameAr,
       this.nameKu,
       this.descriptionEn,
       this.descriptionAr,
       this.descriptionKu,
       this.quantity,
       this.price,
       this.discount,
       this.brandId,
       this.categoryId,
       this.subcategoryId,
       this.coverImage,
       this.createdAt,
       this.updatedAt,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    nameKu = json['name_ku'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    descriptionKu = json['description_ku'];
    quantity = json['quantity'];
    price = json['price'];
    discount = json['discount'];
    brandId = json['brand_id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    coverImage = json['cover_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? nameEn;
  String? nameAr;
  String? nameKu;
  String? descriptionEn;
  String? descriptionAr;
  String? descriptionKu;
  int? quantity;
  int? price;
  int? discount;
  dynamic brandId;
  int? categoryId;
  int? subcategoryId;
  String? coverImage;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_en'] = nameEn;
    map['name_ar'] = nameAr;
    map['name_ku'] = nameKu;
    map['description_en'] = descriptionEn;
    map['description_ar'] = descriptionAr;
    map['description_ku'] = descriptionKu;
    map['quantity'] = quantity;
    map['price'] = price;
    map['discount'] = discount;
    map['brand_id'] = brandId;
    map['category_id'] = categoryId;
    map['subcategory_id'] = subcategoryId;
    map['cover_image'] = coverImage;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}