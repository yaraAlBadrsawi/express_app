import 'package:express_app/core/resources/manager_color.dart';
import 'package:flutter/material.dart';

class SnackBarUtils {
  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: ManagerColor.oliveDrab,
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class CircleProgressIntegatorUtil {
  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: ManagerColor.oliveDrab,
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
