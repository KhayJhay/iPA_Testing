import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:orc_public/models/auth_response.dart';
import 'package:orc_public/models/corporate_model.dart';
import 'package:orc_public/models/individual_model.dart';
import 'package:orc_public/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static var client = https.Client();

  static Future<String> individualSignUp(IndividualModel model) async {
    var headers = {'Content-Type': 'application/json'};

    var url = Uri.parse(Config.indivSignupUrl);
    try {
      var response = await client.post(
        url,
        headers: headers,
        body: jsonEncode(model),
      );
      var data = await json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('loggedIn', true);
        return 'success';
      } else {
        // print(data['phone'][0]);
        if (data['email'] != null) {
          return data['email'][0];
        } else {
          return data['phone'][0];
        }
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> corporateSignUp(CorporateModel model) async {
    var headers = {'Content-Type': 'application/json'};

    var url = Uri.parse(Config.corpSignupUrl);
    try {
      var response = await client.post(
        url,
        headers: headers,
        body: jsonEncode(model),
      );
      var data = await json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('loggedIn', true);
        return 'success';
      } else {
        if (data['email'] != null) {
          return data['email'][0];
        } else {
          return data['phone'][0];
        }
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> verifyOtp(
      String email, String phone, String otp, bool isEmail) async {
    var headers = {'Content-Type': 'application/json'};

    var url = Uri.parse(Config.loginUrl);
    try {
      var response = await client.post(
        url,
        headers: headers,
        body: isEmail
            ? json.encode({"email": email, "otp": otp})
            : json.encode({"phone": phone, "otp": otp}),
      );
      var data = await json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = authResponseModelFromJson(response.body).token;
        await prefs.setString('token', token);
        await prefs.setBool('loggedIn', true);
        if (authResponseModelFromJson(response.body)
            .user
            .identificationNumber
            .toString()
            .isEmpty) {
          await prefs.setBool('isVerified', false);
        } else {
          await prefs.setBool('isVerified', true);
        }
        String userFName =
            authResponseModelFromJson(response.body).user.firstName;
        String userLName =
            authResponseModelFromJson(response.body).user.lastName;
        String email = authResponseModelFromJson(response.body).user.email;
        String identificationNumber =
            authResponseModelFromJson(response.body).user.identificationNumber;
        String contact = authResponseModelFromJson(response.body).user.phone;
        String expiry =
            authResponseModelFromJson(response.body).expiry.toString();
        await prefs.setBool('isVerified', true);
        await prefs.setString('first_name', userFName);
        await prefs.setString('last_name', userLName);
        await prefs.setString('email', email);
        await prefs.setString('contact', contact);
        await prefs.setString('id_number', identificationNumber);
        await prefs.setString('expiry', expiry);
        print(data);
        return 'success';
      } else {
        print(data);
        return data['non_field_errors'][0];
      }
    } catch (e) {
      print(json.encode({"email": email, "otp": otp}));

      print(e.toString());
      return e.toString();
    }
  }

  static Future<String> verifyAccount(String idNumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var headers = {
      'Authorization': 'Token$token',
      'Content-Type': 'application/json'
    };

    var url = Uri.parse(Config.verifyAccountUrl);
    try {
      var response = await client.post(
        url,
        headers: headers,
        body: json
            .encode({"id_number": "GHA-38928822-4", "id_type": "Ghana Card"}),
      );
      var data = await json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        String userFName =
            authResponseModelFromJson(response.body).user.firstName;
        String userLName =
            authResponseModelFromJson(response.body).user.lastName;
        String email = authResponseModelFromJson(response.body).user.email;
        String identificationNumber =
            authResponseModelFromJson(response.body).user.identificationNumber;
        String contact = authResponseModelFromJson(response.body).user.phone;

        await prefs.setBool('isVerified', true);
        await prefs.setString('first_name', userFName);
        await prefs.setString('last_name', userLName);
        await prefs.setString('email', email);
        await prefs.setString('contact', contact);
        await prefs.setString('id_number', identificationNumber);

        print("${userFName}${userLName}");
        return 'success';
      } else {
        print(data);
        return data['detail'];
      }
    } catch (e) {
      print(json.encode({"id_number": idNumber, "id_type": "Ghana Card"}));
      return e.toString();
    }
  }

  static Future<String> login(String email, String phone, bool isEmail) async {
    var headers = {'Content-Type': 'application/json'};
    String email_params = '?email=$email';
    String phone_params = '?phone=$phone';
    var url = Uri.parse(isEmail
        ? Config.generateOtpUrl + phone_params
        : Config.generateOtpUrl + email_params);
    try {
      var response = await client.get(
        url,
        headers: headers,
      );
      var data = await json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return 'success';
      } else {
        return data['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<bool> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var headers = {'Authorization': 'Token $token'};

    var url = Uri.parse(Config.logoutUrl);

    var response = await client.post(
      url,
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  static Future<bool> checkTokenExpiration() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime? now = DateTime.now();
    String? expiry = prefs.getString('expiry');

    if (expiry == null) {
      prefs.setBool('loggedIn', false);
      prefs.setBool('entrypoint', false);
      return true;
    }

    DateTime expiredDate = DateTime.parse(expiry);
    bool isExpired = expiredDate.isBefore(now);

    if (isExpired) {
      prefs.setBool('loggedIn', false);
      prefs.setBool('entrypoint', false);
      return true;
    } else {
      return false;
    }
  }
}
