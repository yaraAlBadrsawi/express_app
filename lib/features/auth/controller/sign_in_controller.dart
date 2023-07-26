import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/network/auth_api.dart';
import '../../../core/resources/manager_strings.dart';
import '../../../core/validation/validation.dart';
import '../../../core/widget/dialog_util.dart';
import '../../../routes/routes.dart';
import 'package:express_app/core/resources/manager_color.dart';

class SignInController extends GetxController {
  // bool isLoading = false;
  RxBool isLoading = false.obs;
  late TextEditingController emailController, passwordController;
  // final TextEditingController _passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    print('onInit');
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> performLogin() async {
    LoadingDialog.show();
    if (Validation.validateEmail(emailController.text) == null) {
      Get.snackbar(
          Validation.validateEmail(emailController.text) ?? "correct", '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ManagerColor.oliveDrab);
    }
    if (Validation.validatePassword(passwordController.text) == null) {
      Get.snackbar(
          Validation.validateEmail(passwordController.text) ?? "correct", '',
          snackPosition: SnackPosition.BOTTOM);
    }

    if (Validation.validateEmail(emailController.text) != null &&
        Validation.validatePassword(passwordController.text) != null) {
      isLoading(true);
      try {
        await AuthApi.signIn(emailController.text, passwordController.text);
        LoadingDialog.hide();
        Get.snackbar(ManagerStrings.signInDone, '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ManagerColor.oliveDrab);
        await Get.toNamed(Routes.bottomNavigationView);
      } catch (error) {
        Get.snackbar(ManagerStrings.signupFailed, '');
      } finally {
        isLoading(false);
      }
    }
  }
}
