class Sizes {
  Sizes({
      this.id, 
      this.value, 
      this.productId, 
      this.createdAt, 
      this.updatedAt,});

  Sizes.fromJson(dynamic json) {
    id = json['id'];
    value = json['value'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? value;
  int? productId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['value'] = value;
    map['product_id'] = productId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}