import 'dart:convert';

WorkerRegistrationModel workerRegistrationModelFromJson(String str) => WorkerRegistrationModel.fromJson(json.decode(str));

String workerRegistrationModelToJson(WorkerRegistrationModel data) => json.encode(data.toJson());

class WorkerRegistrationModel {
  WorkerRegistrationModel({
    this.id,
    this.city,
    this.description,
    this.subscription,
    this.skill,
    this.image,
  });

  int ?id;
  String ?city;
  String ?description;
  String ?subscription;
  List<String> ?skill;
  dynamic image;

  factory WorkerRegistrationModel.fromJson(Map<String, dynamic> json) => WorkerRegistrationModel(
    id: json["id"],
    city: json["city"],
    description: json["description"],
    subscription: json["subscription"],
    skill: List<String>.from(json["skill"].map((x) => x)),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city": city,
    "description": description,
    "subscription": subscription,
    "skill": List<dynamic>.from(skill!.map((x) => x)),
    "image": image,
  };
}
