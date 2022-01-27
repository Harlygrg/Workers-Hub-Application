// To parse this JSON data, do
//
//     final userRegistrationModel = userRegistrationModelFromJson(jsonString);

import 'dart:convert';

List<UserRegistrationModel> userRegistrationModelFromJson(String str) => List<UserRegistrationModel>.from(json.decode(str).map((x) => UserRegistrationModel.fromJson(x)));

String userRegistrationModelToJson(List<UserRegistrationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserRegistrationModel {
  UserRegistrationModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.phone,
    this.password,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? phone;
  String? password;

  factory UserRegistrationModel.fromJson(Map<String, dynamic> json) => UserRegistrationModel(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    address: json["address"],
    phone: json["phone"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "address": address,
    "phone": phone,
    "password": password,
  };
}
