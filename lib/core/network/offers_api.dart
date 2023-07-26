import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../util/api_const.dart';

class OffersApi extends GetxController {
  static Future<List<dynamic>> getOffers() async {
    final List<String> items = []; //  List<String>
    try {
      var response = await http.get(Uri.parse(ApiConstants.getOffersEndPoint));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        // print('body => ${response.body}');

        List<dynamic> offersList = data['offers'];
        // for (var offers in offersList) {
        //   items.add(offers['name']);
        // }
        return offersList;
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
