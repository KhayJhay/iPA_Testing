import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:orc_public/models/address_model.dart';
import 'package:orc_public/models/business_creation_model.dart';
import 'package:orc_public/models/business_reg_response.dart';
import 'package:orc_public/models/sector_model.dart';
import 'package:orc_public/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessCreationHelper {
  static var client = https.Client();

  static Future<String> businessCreation(BusinessCreationModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var headers = {
      'Authorization': 'Token $token',
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.createBusinessUrl);

    try {
      var response =
          await client.post(url, headers: headers, body: json.encode(model));
      var data = await json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        prefs.setInt('businessId', data['id']);
        return 'success';
      } else {
        return data['name'][0];
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> patchOfficeAddress(
      AddressModel model, bool isOffice, bool isPrincipal, isCompany) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    int? id = prefs.getInt('businessId');
    var headers = {
      'Authorization': 'Token $token',
      'Content-Type': 'application/json',
    };

    String param = '?company_id=$id';

    print(param);

    var url = Uri.parse(Config.createBusinessUrl + param);

    try {
      var response = await client.patch(url,
          headers: headers,
          body: isOffice
              ? json.encode({
                  "office_address": model,
                })
              : isPrincipal
                  ? json.encode({
                      "principal_place_of_business": model,
                    })
                  : json.encode({
                      "address": model,
                    }));
      var data = await json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return 'success';
      } else {
        return response.reasonPhrase ?? '';
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<List<SectorModel>> getBusinessSectors() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var headers = {
      'Authorization': 'Token $token',
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.getSectorsUrl);

    var response = await client.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = await json.decode(response.body);
      List jsonResponse = data;
      print(data);
      return jsonResponse.map((item) => SectorModel.fromJson(item)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  static Future<List<SectorModel>> getBusinessIsicsCodes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var headers = {
      'Authorization': 'Token $token',
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.getIsicsUrl);

    var response = await client.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = await json.decode(response.body);
      List jsonResponse = data;
      print(data);
      return jsonResponse.map((item) => SectorModel.fromJson(item)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
