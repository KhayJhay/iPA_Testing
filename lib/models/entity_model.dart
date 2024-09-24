// To parse this JSON data, do
//
//     final entityModel = entityModelFromJson(jsonString);

import 'dart:convert';

EntityModel entityModelFromJson(String str) =>
    EntityModel.fromJson(json.decode(str));

String entityModelToJson(EntityModel data) => json.encode(data.toJson());

class EntityModel {
  final int? id;
  final dynamic address;
  final dynamic officeAddress;
  final dynamic registerOfMembersAddress;
  final dynamic principalPlaceOfBusiness;
  final List<Sector>? sector;
  final List<dynamic>? isicCode;
  final List<dynamic>? directors;
  final List<dynamic>? secretaries;
  final List<dynamic>? auditors;
  final String? name;
  final String? tin;
  final String? postalAddress;
  final String? natureOfBusiness;
  final String? constitution;
  final String? endingWith;
  final bool? declared;
  final dynamic presentedBy;
  final dynamic presentedByTinOrGhanacard;
  final dynamic description;
  final dynamic dateCommencement;
  final String? status;
  final String? businessType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final bool? deleted;
  final bool? active;
  final String? user;

  EntityModel({
    this.id,
    this.address,
    this.officeAddress,
    this.registerOfMembersAddress,
    this.principalPlaceOfBusiness,
    this.sector,
    this.isicCode,
    this.directors,
    this.secretaries,
    this.auditors,
    this.name,
    this.tin,
    this.postalAddress,
    this.natureOfBusiness,
    this.constitution,
    this.endingWith,
    this.declared,
    this.presentedBy,
    this.presentedByTinOrGhanacard,
    this.description,
    this.dateCommencement,
    this.status,
    this.businessType,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.deleted,
    this.active,
    this.user,
  });

  factory EntityModel.fromJson(Map<String, dynamic> json) => EntityModel(
        id: json["id"],
        address: json["address"],
        officeAddress: json["office_address"],
        registerOfMembersAddress: json["register_of_members_address"],
        principalPlaceOfBusiness: json["principal_place_of_business"],
        sector: json["sector"] == null
            ? []
            : List<Sector>.from(json["sector"]!.map((x) => Sector.fromJson(x))),
        isicCode: json["isic_code"] == null
            ? []
            : List<dynamic>.from(json["isic_code"]!.map((x) => x)),
        directors: json["directors"] == null
            ? []
            : List<dynamic>.from(json["directors"]!.map((x) => x)),
        secretaries: json["secretaries"] == null
            ? []
            : List<dynamic>.from(json["secretaries"]!.map((x) => x)),
        auditors: json["auditors"] == null
            ? []
            : List<dynamic>.from(json["auditors"]!.map((x) => x)),
        name: json["name"],
        tin: json["tin"],
        postalAddress: json["postal_address"],
        natureOfBusiness: json["nature_of_business"],
        constitution: json["constitution"],
        endingWith: json["ending_with"],
        declared: json["declared"],
        presentedBy: json["presented_by"],
        presentedByTinOrGhanacard: json["presented_by_tin_or_ghanacard"],
        description: json["description"],
        dateCommencement: json["date_commencement"],
        status: json["status"],
        businessType: json["business_type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        deleted: json["deleted"],
        active: json["active"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "office_address": officeAddress,
        "register_of_members_address": registerOfMembersAddress,
        "principal_place_of_business": principalPlaceOfBusiness,
        "sector": sector == null
            ? []
            : List<dynamic>.from(sector!.map((x) => x.toJson())),
        "isic_code":
            isicCode == null ? [] : List<dynamic>.from(isicCode!.map((x) => x)),
        "directors": directors == null
            ? []
            : List<dynamic>.from(directors!.map((x) => x)),
        "secretaries": secretaries == null
            ? []
            : List<dynamic>.from(secretaries!.map((x) => x)),
        "auditors":
            auditors == null ? [] : List<dynamic>.from(auditors!.map((x) => x)),
        "name": name,
        "tin": tin,
        "postal_address": postalAddress,
        "nature_of_business": natureOfBusiness,
        "constitution": constitution,
        "ending_with": endingWith,
        "declared": declared,
        "presented_by": presentedBy,
        "presented_by_tin_or_ghanacard": presentedByTinOrGhanacard,
        "description": description,
        "date_commencement": dateCommencement,
        "status": status,
        "business_type": businessType,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "deleted": deleted,
        "active": active,
        "user": user,
      };
}

class Sector {
  final int? id;
  final String? name;
  final String? code;

  Sector({
    this.id,
    this.name,
    this.code,
  });

  factory Sector.fromJson(Map<String, dynamic> json) => Sector(
        id: json["id"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
      };
}
