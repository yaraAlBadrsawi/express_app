import 'package:express_app/core/resources/manager_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../core/base_model/user.dart';
import '../../../core/network/auth_api.dart';
import '../../../core/resources/manager_strings.dart';
import '../../../core/secure_storage/secure_storage.dart';
import '../../../core/validation/validation.dart';
import '../../../core/widget/dialog_util.dart';
import '../../../routes/routes.dart';

class SignUpController extends GetxController {
  final storage = const FlutterSecureStorage();

  RxBool isChecked = false.obs;

  void toggleCheckbox() {
    isChecked.toggle();
  }

  late TextEditingController emailController,
      passwordController,
      nameController,
      mobileController;

  @override
  void onInit() {
    super.onInit();
    print('onInit');
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    mobileController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    mobileController.dispose();
  }

  Future<void> performRegister() async {
    if (nameController.text.isEmpty &&
        emailController.text.isEmpty &&
        passwordController.text.isEmpty &&
        mobileController.text.isEmpty) {
      Get.snackbar(ManagerStrings.dataCantBeEmpty, '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ManagerColor.oliveDrab);
    }

    if (Validation.validateEmail(emailController.text) != null &&
        Validation.validatePassword(passwordController.text) == null &&
        Validation.validateMobileNumber(passwordController.text) == null) {
      Get.snackbar(Validation.validateEmail(emailController.text) ?? '', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ManagerColor.oliveDrab);
    }
    if (Validation.validateEmail(emailController.text) == null &&
        Validation.validatePassword(passwordController.text) != null &&
        Validation.validateMobileNumber(passwordController.text) == null) {
      Get.snackbar(
          Validation.validatePassword(passwordController.text) ?? '', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ManagerColor.oliveDrab);
    }
    if (Validation.validateEmail(emailController.text) == null &&
        Validation.validatePassword(passwordController.text) == null &&
        Validation.validateMobileNumber(mobileController.text) != null) {
      Get.snackbar(
          Validation.validateMobileNumber(mobileController.text) ?? '', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ManagerColor.oliveDrab);
    }

    try {
      LoadingDialog.show();
      await AuthApi.signUp(user);

      SecureStorage().writeSecureStorage(ManagerStrings.email, user.email);
      SecureStorage().writeSecureStorage(ManagerStrings.name, user.name);
      SecureStorage()
          .writeSecureStorage(ManagerStrings.password, user.password);
      SecureStorage().writeSecureStorage(ManagerStrings.phone, user.mobile);

      if (await SecureStorage().readSecureStorage(ManagerStrings.name) !=
          null) {
        Get.snackbar(ManagerStrings.signUpDone, '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ManagerColor.white,
            colorText: ManagerColor.oliveDrab);

        Get.snackbar(ManagerStrings.userDataSaved, '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ManagerColor.oliveDrab);
      }

      LoadingDialog.hide();
      await Get.toNamed(Routes.bottomNavigationView);
    } catch (error) {
      Get.snackbar(ManagerStrings.signupFailed, 'with error => $error');
      print('ERROR => $error');
    } finally {}
  }

  User get user {
    User user = User();
    user.email = emailController.text;
    user.password = passwordController.text;
    user.name = nameController.text;
    user.mobile = mobileController.text;
    return user;
  }
}
