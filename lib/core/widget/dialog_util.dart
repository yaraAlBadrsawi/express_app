import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DialogUtils {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(
                color: ManagerColor.oliveDrab,
              ),
              SizedBox(width: ManagerWidth.w15),
              Text(ManagerStrings.creatingAccount),
            ],
          ),
        );
      },
    );
  }
}

class LoadingDialog {
  static void show() {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(
          color: ManagerColor.oliveDrab,
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hide() {
    Get.back();
  }
}
