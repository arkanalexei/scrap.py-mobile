import 'dart:convert';

List<Search> searchFromJson(String str) => List<Search>.from(json.decode(str).map((x) => Search.fromJson(x)));

String searchToJson(List<Search> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Search {
    Search({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Search.fromJson(Map<String, dynamic> json) => Search(
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
    required this.name,
    required this.message,
    required this.star,
    required this.created_at,
    required this.user_id,
  });

  String name; 
  String message;
  String star;
  DateTime created_at; // automatic
  int user_id; // automatic

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        message: json["message"],
        star: json["star"],
        created_at: DateTime.parse(json["created_at"]),
        user_id: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "message": message,
        "star": star,
        "created_at":
            "${created_at.year.toString().padLeft(4, '0')}-${created_at.month.toString().padLeft(2, '0')}-${created_at.day.toString().padLeft(2, '0')}",
        "user_id": user_id, 
     };
}
