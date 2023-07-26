import 'package:get/get.dart';

import '../controller/fag_controller.dart';

class FagBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FagController());
  }
}
