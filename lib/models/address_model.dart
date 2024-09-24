// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  final String? city;
  final String? region;
  final String? digitalAddress;
  final String? houseNumber;
  final String? streetName;
  final String? district;
  final String? country;

  AddressModel({
    this.city,
    this.region,
    this.digitalAddress,
    this.houseNumber,
    this.streetName,
    this.district,
    this.country,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        city: json["city"],
        region: json["region"],
        digitalAddress: json["digitalAddress"],
        houseNumber: json["houseNumber"],
        streetName: json["streetName"],
        district: json["district"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "region": region,
        "digitalAddress": digitalAddress,
        "houseNumber": houseNumber,
        "streetName": streetName,
        "district": district,
        "country": country,
      };
}
