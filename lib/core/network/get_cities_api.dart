import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../util/api_const.dart';

class GetCitiesApi extends GetxController {
  static Future<List<String>> getCities() async {
    List<String> citiesList = [];
    try {
      var response = await http.get(Uri.parse(ApiConstants.getCityEndPoint));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        print('body => ${response.body}');

        // see translate first
        List<dynamic> cities = data['cities'];
        for (var city in cities) {
          citiesList.add(city['name']);
        }
        return citiesList;
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Request: ${response.request}');
        return [];
      }
    } catch (e) {
      // Error occurred, handle the exception
      print('Error: $e');
    }
    return [];
  }
}
