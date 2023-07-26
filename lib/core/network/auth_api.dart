import 'package:express_app/core/base_model/user.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../resources/manager_color.dart';
import '../resources/manager_strings.dart';
import '../util/api_const.dart';
import 'package:http/http.dart' as http;

class AuthApi extends GetxController {
  static Future<bool> signIn(String email, String password) async {
    var url = Uri.parse(ApiConstants.signUpEndPoint);
    try {
      http.Response response = await http.post(url, body: {
        'email': email,
        'password': password,
      });
      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        Get.snackbar(ManagerStrings.signInDone, '');
        return true;
      }
    } catch (e) {
      // Error occurred, handle the exception
      print('Error: $e');
    }
    return false;
  }

  static Future<bool> signUp(User user) async {
    var url = Uri.parse(ApiConstants.loginEndPoint);
    try {
      http.Response response = await http.post(url, body: {
        'email': user.email,
        'password': user.password, //user.password
        'name': user.name, //user.password
        'mobile': user.mobile, //user.password
      });

      if (response.statusCode == 200) {
        print('response = ${response.statusCode}');
        return true;
      }
    } catch (e) {
      print('Error: $e');
    }
    return false;
  }

  // Future<bool> logout({required BuildContext BuildContext}) async {
  //   print('kclmackacmaa');

  //   Uri uri = Uri.parse(ApiConstants.logOutEndPoint);
  //   http.Response response = await http.post(uri, headers: {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization': 'Bearer $token',
  //   });
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     print('logout success ');
  //     SharedPrefController().clear;
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
