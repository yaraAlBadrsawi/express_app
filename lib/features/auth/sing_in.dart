import 'dart:ui';
import 'package:express_app/core/resources/manager_assets.dart';
import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/main_button.dart';
import 'package:express_app/core/widget/text_field.dart';
import 'package:express_app/features/auth/widget/auth_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/resources/manager_fonts.dart';
import '../../core/widget/dialog_util.dart';
import '../../routes/routes.dart';
import 'controller/sign_in_controller.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBox(
        ManagerStrings.signIn,
        Column(
          children: [
            SizedBox(
              height: ManagerHeight.h40,
            ),
            Image.asset(ManagerAssets.logo),
            SizedBox(
              height: ManagerHeight.h45,
            ),
            TextFieldWidget(controller.emailController, ManagerStrings.email,
                ManagerWidth.w27, Icons.email),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            TextFieldWidget(controller.passwordController,
                ManagerStrings.password, ManagerWidth.w27, Icons.key),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                    right: ManagerWidth.w27, top: ManagerHeight.h13),
                child: Text(
                  ManagerStrings.forgetPassword,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: ManagerFontSize.s11),
                ),
              ),
            ),
            SizedBox(
              height: ManagerHeight.h80,
            ),
            MainButton(
              ManagerStrings.signIn,
              ManagerWidth.w150,
              () {
                // controller.isLoading(true);
                // DialogUtils.showLoadingDialog(context);
                controller
                    .performLogin(); // no controller for password repeater
                controller.isLoading(false);
              },
              radius: ManagerRadius.r23,
            ),
            SizedBox(
              height: ManagerHeight.h15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ManagerStrings.doNotHaveAccount,
                  style: TextStyle(
                    fontWeight: ManagerFontWeight.bold,
                    fontSize: ManagerFontSize.s10,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: ManagerColor.oliveDrab),
                  onPressed: () {
                    Get.toNamed(Routes.signUpView);
                  },
                  child: Text(
                    ManagerStrings.signUp,
                    style: TextStyle(
                      color: ManagerColor.oliveDrab,
                      fontWeight: ManagerFontWeight.bold,
                      fontSize: ManagerFontSize.s16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
