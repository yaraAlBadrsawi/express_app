import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LocalController extends GetxController {
  void changeLanguage(String codeLanguage) {
    Get.updateLocale(Locale(codeLanguage));
  }
}
