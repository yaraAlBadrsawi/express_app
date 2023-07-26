import 'package:flutter/cupertino.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import '../resources/manager_strings.dart';

class Validation {
  static String? validateEmail(String? email) {
    if (email!.isEmpty) {
      print('email!.isEmpty');
      return ManagerStrings.emailCantBeEmpty;
    }

    if (!RegExp(r"\S+@\S+\.\S+").hasMatch(email)) {
      print('RegExp(r"\S+@\S+\.\S+").hasMatch(email)');
      return ManagerStrings.invalidEmail;
    }

    if (!GetUtils.isEmail(email)) {
      print('!GetUtils.isEmail(email)');
      return ManagerStrings.invalidEmail;
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return ManagerStrings.passwordCantBeEmpty;
    }

    if (password.length < 8) {
      return ManagerStrings.invalidPassword;
    }
    return null;
  }

  static String? validateMobileNumber(String value) {
    RegExp mobileNumberPattern = RegExp(r'^\+[1-9]\d{1,14}$');

    if (value.isEmpty) {
      return ManagerStrings.dataCantBeEmpty;
    }
    if (!mobileNumberPattern.hasMatch(value)) {
      return ManagerStrings.invalidMobileNumber;
    } else {
      return null; // return null if the text is valid
    }
  }

  static String? validateRepeatPassword(
      TextEditingController passwordController,
      TextEditingController repeatPasswordController) {
    if (passwordController.value.text != repeatPasswordController.value.text) {
      return ManagerStrings.mismatchedPassword;
    } else {
      return null; // return null if the text is valid
    }
  }
}
