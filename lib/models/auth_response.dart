import 'dart:convert';

AuthResponseModel authResponseModelFromJson(String str) =>
    AuthResponseModel.fromJson(json.decode(str));

String authResponseModelToJson(AuthResponseModel data) =>
    json.encode(data.toJson());

class AuthResponseModel {
  final DateTime expiry;
  final String token;
  final User user;

  AuthResponseModel({
    required this.expiry,
    required this.token,
    required this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        expiry: DateTime.parse(json["expiry"]),
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "expiry": expiry.toIso8601String(),
        "token": token,
        "user": user.toJson(),
      };
}

class User {
  final String firstName;
  final String lastName;
  final String email;
  final dynamic identificationType;
  final dynamic identificationNumber;
  final String phone;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.identificationType,
    required this.identificationNumber,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        identificationType: json["identification_type"],
        identificationNumber: json["identification_number"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "identification_type": identificationType,
        "identification_number": identificationNumber,
        "phone": phone,
      };
}
