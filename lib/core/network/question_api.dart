import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../util/api_const.dart';

class QuestionApi extends GetxController {
  static Future<List<dynamic>> getQuestions() async {
    final List<String> items = []; //  List<String>
    try {
      var response =
          await http.get(Uri.parse(ApiConstants.allQuestionsEndPoint));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        // print('body => ${response.body}');

        List<dynamic> questionsList = data['questions'];
        // for (var offers in offersList) {
        //   items.add(offers['name']);
        // }
        return questionsList;
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
