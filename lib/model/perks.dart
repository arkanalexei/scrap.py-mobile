// To parse this JSON data, do
//
//     final perks = perksFromJson(jsonString);

import 'dart:convert';

List<Perks> perksFromJson(String str) => List<Perks>.from(json.decode(str).map((x) => Perks.fromJson(x)));

String perksToJson(List<Perks> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Perks {
    Perks({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Perks.fromJson(Map<String, dynamic> json) => Perks(
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
        required this.nama,
        required this.deskripsi,
        required this.harga,
    });

    String nama;
    String deskripsi;
    int harga;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        harga: json["harga"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "deskripsi": deskripsi,
        "harga": harga,
    };
}
