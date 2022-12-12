import 'dart:convert';
// import 'dart:ffi';

List<WasteDeposit> wasteDepositFromJson(String str) => List<WasteDeposit>.from(
      json.decode(str).map((x) => WasteDeposit.fromJson(x)),
    );

String wasteDepositToJson(List<WasteDeposit> data) => json.encode(
      List<dynamic>.from(data.map((x) => x.toJson())),
    );

class WasteDeposit {
  WasteDeposit({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory WasteDeposit.fromJson(Map<String, dynamic> json) => WasteDeposit(
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
    required this.mass,
    required this.description,
    required this.date_time,
    required this.type,
  });

  int user; // automatic
  double mass;
  String description;
  DateTime date_time; // automatic
  String type;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        mass: json["mass"],
        description: json["description"],
        date_time: DateTime.parse(json["date_time"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "mass": mass,
        "description": description,
        "date_time":
            "${date_time.year.toString().padLeft(4, '0')}-${date_time.month.toString().padLeft(2, '0')}-${date_time.day.toString().padLeft(2, '0')}",
        "type": type,
      };
}
