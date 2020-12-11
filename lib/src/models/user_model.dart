import 'dart:convert';

class UserModel {
  final String id;
   final String name;
  final String username;
  final String email;
  final String mobile;
   final String profileImage;

  UserModel({
    this.id,
     this.name,
    this.username,
    this.email,
    this.mobile,
     this.profileImage,
  });

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] == null ? null : json['id'],
       name: json['name'] == null ? null : json['name'],
      username: json['username'] == null ? null : json['username'],
      email: json['email'] == null ? null : json['email'],
      mobile: json['mobile'] == null ? null : json['mobile'],
       profileImage: json['profileImage'] == null ? null : json['profileImage'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id == null ? null : id,
       'name': name == null ? null : name,
      'username': username == null ? null : username,
      'email': email == null ? null : email,
      'mobile': mobile == null ? null : mobile,
       'profileImage': profileImage == null ? null : profileImage,
    };
  }
}
