class Coach {
  Coach({
      this.id, 
      this.nickName, 
      this.contactEmail, 
      this.description, 
      this.contactPhoneNumber, 
      this.userId, 
      this.experience, 
      this.introVideo, 
      this.createdAt, 
      this.updatedAt, 
      this.name, 
      this.country, 
      this.address, 
      this.age, 
      this.gender, 
      this.profileImage, 
      this.email, 
      this.phoneNumber,});

  Coach.fromJson(dynamic json) {
    id = json['id'];
    nickName = json['nick_name'];
    contactEmail = json['contact_email'];
    description = json['description'];
    contactPhoneNumber = json['contact_phone_number'];
    userId = json['user_id'];
    experience = json['experience'];
    introVideo = json['intro_video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    country = json['country'];
    address = json['address'];
    age = json['age'];
    gender = json['gender'];
    profileImage = json['profile_image'];
    email = json['email'];
    phoneNumber = json['phone_number'];
  }
  int? id;
  String? nickName;
  String? contactEmail;
  String? description;
  String? contactPhoneNumber;
  int? userId;
  String? experience;
  String? introVideo;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? country;
  String? address;
  int? age;
  int? gender;
  String? profileImage;
  String? email;
  String? phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nick_name'] = nickName;
    map['contact_email'] = contactEmail;
    map['description'] = description;
    map['contact_phone_number'] = contactPhoneNumber;
    map['user_id'] = userId;
    map['experience'] = experience;
    map['intro_video'] = introVideo;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['name'] = name;
    map['country'] = country;
    map['address'] = address;
    map['age'] = age;
    map['gender'] = gender;
    map['profile_image'] = profileImage;
    map['email'] = email;
    map['phone_number'] = phoneNumber;
    return map;
  }

}