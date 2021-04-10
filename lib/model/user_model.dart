// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.imageUrl,
    this.isFav,
    this.isBlocked,
  });

  int id;
  String name;
  String imageUrl;
  bool isFav;
  bool isBlocked;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    isFav: json["isFav"] == null ? null : json["isFav"],
    isBlocked: json["isBlocked"] == null ? null : json["isBlocked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "isFav": isFav == null ? null : isFav,
    "isBlocked": isBlocked == null ? null : isBlocked,
  };
}
