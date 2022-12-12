// To parse this JSON data, do
//
//     final achiever = achieverFromJson(jsonString);

import 'dart:convert';

List<Achiever> achieverFromJson(String str) => List<Achiever>.from(json.decode(str).map((x) => Achiever.fromJson(x)));

String achieverToJson(List<Achiever> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Achiever {
    Achiever({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Achiever.fromJson(Map<String, dynamic> json) => Achiever(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.user,
        required this.name,
        required this.points,
    });

    int user;
    String name;
    int points;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        points: json["points"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "points": points,
    };
}
