// To parse this JSON data, do
//
//     final businessCreationModel = businessCreationModelFromJson(jsonString);

import 'dart:convert';

BusinessCreationModel businessCreationModelFromJson(String str) =>
    BusinessCreationModel.fromJson(json.decode(str));

String businessCreationModelToJson(BusinessCreationModel data) =>
    json.encode(data.toJson());

class BusinessCreationModel {
  final String? name;
  final String? tin;
  final String? postalAddress;
  final String? natureOfBusiness;
  final String? principalBusinessActivity;
  final List<String>? sector;
  final String? constitution;
  final String? endingWith;
  final String? businessType;
  final List<String>? isicCode;
  final String? idontevenkowthisfield;
  final String? presentedBy;
  final String? description;

  BusinessCreationModel({
    this.name,
    this.tin,
    this.postalAddress,
    this.natureOfBusiness,
    this.principalBusinessActivity,
    this.sector,
    this.constitution,
    this.endingWith,
    this.businessType,
    this.isicCode,
    this.idontevenkowthisfield,
    this.presentedBy,
    this.description,
  });

  factory BusinessCreationModel.fromJson(Map<String, dynamic> json) =>
      BusinessCreationModel(
        name: json["name"],
        tin: json["tin"],
        postalAddress: json["postal_address"],
        natureOfBusiness: json["nature_of_business"],
        principalBusinessActivity: json["principal_business_activity"],
        sector: json["sector"] == null
            ? []
            : List<String>.from(json["sector"]!.map((x) => x)),
        constitution: json["constitution"],
        endingWith: json["ending_with"],
        businessType: json["business_type"],
        isicCode: json["isic_code"] == null
            ? []
            : List<String>.from(json["isic_code"]!.map((x) => x)),
        idontevenkowthisfield: json["idontevenkowthisfield"],
        presentedBy: json["presented_by"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "tin": tin,
        "postal_address": postalAddress,
        "nature_of_business": natureOfBusiness,
        "principal_business_activity": principalBusinessActivity,
        "sector":
            sector == null ? [] : List<dynamic>.from(sector!.map((x) => x)),
        "constitution": constitution,
        "ending_with": endingWith,
        "business_type": businessType,
        "isic_code":
            isicCode == null ? [] : List<dynamic>.from(isicCode!.map((x) => x)),
        "idontevenkowthisfield": idontevenkowthisfield,
        "presented_by": presentedBy,
        "description": description,
      };
}
