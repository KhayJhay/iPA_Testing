import 'dart:convert';

CorporateModel corporateModelFromJson(String str) =>
    CorporateModel.fromJson(json.decode(str));

String corporateModelToJson(CorporateModel data) => json.encode(data.toJson());

class CorporateModel {
  final String email;
  final String phoneNumber;
  final String cin;

  CorporateModel({
    required this.email,
    required this.phoneNumber,
    required this.cin,
  });

  factory CorporateModel.fromJson(Map<String, dynamic> json) => CorporateModel(
        email: json["email"],
        phoneNumber: json["phone"],
        cin: json["cin"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phoneNumber,
        "cin": cin,
      };
}
