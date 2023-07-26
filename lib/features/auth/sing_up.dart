import 'package:express_app/core/widget/dialog_util.dart';
import 'package:express_app/features/auth/widget/auth_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../core/resources/manager_assets.dart';
import '../../core/resources/manager_color.dart';
import '../../core/resources/manager_fonts.dart';
import '../../core/resources/manager_sizes.dart';
import '../../core/resources/manager_strings.dart';
import '../../core/widget/main_button.dart';
import '../../core/widget/text_field.dart';
import '../../routes/routes.dart';
import 'controller/sing_up_controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBox(
        ManagerStrings.signUp,
        Column(
          children: [
            SizedBox(
              height: ManagerHeight.h40,
            ),
            Image.asset(ManagerAssets.logo),
            SizedBox(
              height: ManagerHeight.h45,
            ),
            TextFieldWidget(controller.nameController, ManagerStrings.name,
                ManagerWidth.w27, Icons.person),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            TextFieldWidget(controller.emailController, ManagerStrings.email,
                ManagerWidth.w27, Icons.email),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            TextFieldWidget(controller.mobileController, ManagerStrings.phone,
                ManagerWidth.w27, Icons.phone),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            TextFieldWidget(controller.passwordController,
                ManagerStrings.password, ManagerWidth.w27, Icons.key),
            SizedBox(
              height: ManagerHeight.h50,
            ),
            MainButton(ManagerStrings.signUp, ManagerWidth.w150, () {
              controller.performRegister();
            }),
            SizedBox(
              height: ManagerHeight.h13,
            ),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: controller.isChecked.value,
                    activeColor: ManagerColor.oliveDrab,
                    onChanged: (newValue) {
                      controller.toggleCheckbox();
                    },
                  ),
                ),
                Text(
                  ManagerStrings.termsAndPrivacy,
                  style: TextStyle(
                    fontWeight: ManagerFontWeight.bold,
                    fontSize: ManagerFontSize.s10,
                  ),
                ),
              ],
            ),
            TextButton(
              style:
                  TextButton.styleFrom(foregroundColor: ManagerColor.oliveDrab),
              onPressed: () {
                Get.toNamed(Routes.signInView);
              },
              child: Text(
                ManagerStrings.signIn,
                style: TextStyle(
                  color: ManagerColor.oliveDrab,
                  fontWeight: ManagerFontWeight.bold,
                  fontSize: ManagerFontSize.s16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
