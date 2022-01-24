import 'dart:convert';
import 'package:apollocode_flutter_utilities/models/address.dart';
import 'package:apollocode_flutter_utilities/models/suggestion.dart';
import 'package:apollocode_flutter_utilities/services/auth.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class CanadaPostService {
  static const baseUrl =
      "https://ws1.postescanada-canadapost.ca/Capture/Interactive/";
  static const endpoint = "/ccs/providers";
  static const key = "TF36-KU97-AB94-ZC85";

  static Future<List<Suggestion>> getAddressesSuggestions(
      {Map<String, dynamic>? queryParameters}) async {

    String queryParams = "";

    if (queryParameters != null) {
      queryParameters.forEach((key, value) {
        queryParams += '$key=$value&';
      });
    }

    var uri =
        Uri.parse('${baseUrl}Find/v1.00/json3ex.ws?Key=$key&$queryParams');

    return await http.get(uri, headers: {
      'content-type': 'application/json',
    }).then((response) async {
      switch (response.statusCode) {
        case 200:
          Map<String, dynamic> data = jsonDecode(response.body);
          List<Suggestion> suggestions = [];

          for (var i = 0; i < data["Items"].length; i++) {
            var temp = Suggestion.fromJson(data["Items"][i]);

            if (temp.description != "Text or Container Required" && !temp.description!.endsWith('Addresses')) {
              suggestions.add(temp);
            }
          }

          return suggestions;
        default:
          throw ErrorDescription("An error occured.");
      }
    });
  }

  static Future<Address> getAddress(String id) async {
    var token = await Auth.getToken();
    if (token == null) throw Error();

    var uri = Uri.parse('${baseUrl}Retrieve/v1.00/json3ex.ws?Key=$key&Id=$id');

    return await http.get(uri, headers: {
      'content-type': 'application/json',
    }).then((response) async {
      switch (response.statusCode) {
        case 200:
          Map<String, dynamic> data = jsonDecode(response.body);

          var address = Address(
              street: data["Items"][0]["Street"],
              number: data["Items"][0]["BuildingNumber"],
              apt: data["Items"][0]["SubBuilding"],
              city: data["Items"][0]["City"],
              province: data["Items"][0]["ProvinceCode"],
              zipCode: data["Items"][0]["PostalCode"]);

          return address;
        default:
          throw ErrorDescription("An error occured.");
      }
    });
  }
}
