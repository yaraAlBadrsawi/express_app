import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../util/api_const.dart';

class GetAds extends GetxController {
  static Future<List<dynamic>> getAds() async {
    final List<String> items = []; //  List<String>
    try {
      var response = await http.get(Uri.parse(ApiConstants.getAdsEndPoint));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        // print('body => ${response.body}');

        List<dynamic> adsList = data['ads'];
        // for (var offers in offersList) {
        //   items.add(offers['name']);
        // }
        return adsList;
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
