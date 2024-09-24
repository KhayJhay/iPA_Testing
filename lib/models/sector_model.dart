// To parse this JSON data, do
//
//     final sectorModel = sectorModelFromJson(jsonString);

import 'dart:convert';

SectorModel sectorModelFromJson(String str) =>
    SectorModel.fromJson(json.decode(str));

String sectorModelToJson(SectorModel data) => json.encode(data.toJson());

class SectorModel {
  final String? name;
  final String? code;

  SectorModel({
    this.name,
    this.code,
  });

  factory SectorModel.fromJson(Map<String, dynamic> json) => SectorModel(
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}
