import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../util/api_const.dart';

class CategoriesApi extends GetxController {
  static Future<List<String>> readCategories() async {
    final List<String> items = []; //  List<String>
    try {
      var response = await http.get(Uri.parse(ApiConstants.categoriesEndPoint));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        print('body => ${response.body}');

        List<dynamic> categoriesList = data['categories'];
        for (var category in categoriesList) {
          items.add(category['name']);
        }
        return items;
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

  static Future<List<String>> readCategoriesImage() async {
    final List<String> items = []; //  List<String>
    try {
      var response = await http.get(Uri.parse(ApiConstants.categoriesEndPoint));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        print('body => ${response.body}');

        List<dynamic> categoriesList = data['categories'];
        for (var category in categoriesList) {
          items.add(category['image']);
        }
        return items;
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

  static Future<List<dynamic>> readProductByCategories(var categoryId) async {
    try {
      var response = await http.get(
          Uri.parse('${ApiConstants.productByCategoryEndPoint}/$categoryId'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        final products = data['products'];
        // Process the products as needed
        // for (var product in products) {
        //   final productId = product['id'];
        //   final name = product['name'];
        // }
        return products;
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
