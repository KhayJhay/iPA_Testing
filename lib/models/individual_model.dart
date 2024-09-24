import 'dart:convert';

IndividualModel individualModelFromJson(String str) =>
    IndividualModel.fromJson(json.decode(str));

String individualModelToJson(IndividualModel data) =>
    json.encode(data.toJson());

class IndividualModel {
  final String email;
  final String phoneNumber;

  IndividualModel({
    required this.email,
    required this.phoneNumber,
  });

  factory IndividualModel.fromJson(Map<String, dynamic> json) =>
      IndividualModel(
        email: json["email"],
        phoneNumber: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phoneNumber,
      };
}
