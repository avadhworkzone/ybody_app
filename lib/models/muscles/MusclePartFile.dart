class MusclePartFile {
  MusclePartFile({
      this.id, 
      this.title, 
      this.description, 
      this.path, 
      this.partId, 
      this.createdAt, 
      this.updatedAt,});

  MusclePartFile.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    path = json['path'];
    partId = json['part_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? title;
  String? description;
  String? path;
  int? partId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['path'] = path;
    map['part_id'] = partId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}