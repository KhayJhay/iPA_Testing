import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:orc_public/models/address_model.dart';
import 'package:orc_public/models/business_creation_model.dart';
import 'package:orc_public/models/business_reg_response.dart';
import 'package:orc_public/models/entity_model.dart';
import 'package:orc_public/models/sector_model.dart';
import 'package:orc_public/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchesHelper {
  static var client = https.Client();
  static Future<List<EntityModel>> entityInfoSearch(String businessName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var headers = {
      'Authorization': 'Token $token',
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.entitySearchUrl + businessName);

    var response = await client.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = await json.decode(response.body);
      List jsonResponse = data;

      return jsonResponse.map((item) => EntityModel.fromJson(item)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  static Future<bool> basicNameSearch(String businessName) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.basicSearchUrl + businessName);

    var response = await client.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = await json.decode(response.body);

      return data['exists'];
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
