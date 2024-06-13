class Parts {
  Parts({
      this.id, 
      this.title, 
      this.coverImage, 
      this.muscleId, 
      this.createdAt, 
      this.updatedAt,});

  Parts.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    coverImage = json['cover_image'];
    muscleId = json['muscle_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? title;
  String? coverImage;
  int? muscleId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['cover_image'] = coverImage;
    map['muscle_id'] = muscleId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}