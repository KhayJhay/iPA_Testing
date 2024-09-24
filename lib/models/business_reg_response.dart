// To parse this JSON data, do
//
//     final businessRegResponse = businessRegResponseFromJson(jsonString);

import 'dart:convert';

BusinessRegResponse businessRegResponseFromJson(String str) =>
    BusinessRegResponse.fromJson(json.decode(str));

String businessRegResponseToJson(BusinessRegResponse data) =>
    json.encode(data.toJson());

class BusinessRegResponse {
  final int? id;
  final dynamic address;
  final dynamic officeAddress;
  final dynamic registerOfMembersAddress;
  final dynamic principalPlaceOfBusiness;
  final List<dynamic>? directors;
  final List<dynamic>? secretaries;
  final List<dynamic>? auditors;
  final String? name;
  final String? tin;
  final String? postalAddress;
  final String? natureOfBusiness;
  final String? principalBusinessActivity;
  final String? constitution;
  final String? endingWith;
  final dynamic entityType;
  final bool? declared;
  final String? status;
  final String? businessType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final bool? deleted;
  final bool? active;
  final String? user;
  final List<int>? sector;

  BusinessRegResponse({
    this.id,
    this.address,
    this.officeAddress,
    this.registerOfMembersAddress,
    this.principalPlaceOfBusiness,
    this.directors,
    this.secretaries,
    this.auditors,
    this.name,
    this.tin,
    this.postalAddress,
    this.natureOfBusiness,
    this.principalBusinessActivity,
    this.constitution,
    this.endingWith,
    this.entityType,
    this.declared,
    this.status,
    this.businessType,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.deleted,
    this.active,
    this.user,
    this.sector,
  });

  factory BusinessRegResponse.fromJson(Map<String, dynamic> json) =>
      BusinessRegResponse(
        id: json["id"],
        address: json["address"],
        officeAddress: json["office_address"],
        registerOfMembersAddress: json["register_of_members_address"],
        principalPlaceOfBusiness: json["principal_place_of_business"],
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
        principalBusinessActivity: json["principal_business_activity"],
        constitution: json["constitution"],
        endingWith: json["ending_with"],
        entityType: json["entity_type"],
        declared: json["declared"],
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
        sector: json["sector"] == null
            ? []
            : List<int>.from(json["sector"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "office_address": officeAddress,
        "register_of_members_address": registerOfMembersAddress,
        "principal_place_of_business": principalPlaceOfBusiness,
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
        "principal_business_activity": principalBusinessActivity,
        "constitution": constitution,
        "ending_with": endingWith,
        "entity_type": entityType,
        "declared": declared,
        "status": status,
        "business_type": businessType,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "deleted": deleted,
        "active": active,
        "user": user,
        "sector":
            sector == null ? [] : List<dynamic>.from(sector!.map((x) => x)),
      };
}
