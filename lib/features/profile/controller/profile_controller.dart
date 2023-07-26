import 'package:express_app/core/resources/manager_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../core/secure_storage/secure_storage.dart';

class ProfileController extends GetxController {
  var email = ''.obs;
  var name = ''.obs;
  var mobile = ''.obs;

  @override
  void onInit() {
    super.onInit();
    print('I am on OnInit');
    readEmail();
    readName();
    readMobileNumber();
  }

  readName() async {
    String nameStr =
        await SecureStorage().readSecureStorage(ManagerStrings.name);
    name.value = nameStr;
    print('name => $name');

    update();
  }

  readEmail() async {
    String emailStr =
        await SecureStorage().readSecureStorage(ManagerStrings.email);
    email.value = emailStr;
    print('email => $email');

    update();
  }

  Future readMobileNumber() async {
    String mobileStr =
        await SecureStorage().readSecureStorage(ManagerStrings.phone);
    mobile.value = mobileStr;
    print('mobile => $mobile');

    update();
  }
}
