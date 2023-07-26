import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/choose_city_controller.dart';

class ChooseCityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseCityController());
  }
}
