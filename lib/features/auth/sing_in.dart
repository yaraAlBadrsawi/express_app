import 'dart:ui';
import 'dart:ui';

import 'package:express_app/config/constants.dart';
import 'package:express_app/core/resources/manager_assets.dart';
import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/main_button.dart';
import 'package:express_app/core/widget/text_field.dart';
import 'package:express_app/features/auth/sing_in.dart';
import 'package:express_app/features/auth/widget/auth_box.dart';
import 'package:flutter/material.dart';

import '../../core/resources/manager_fonts.dart';
import '../../routes/routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
            TextFieldWidget(
                ManagerStrings.email, ManagerWidth.w27, Icons.email),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            TextFieldWidget(
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
              () {},
              radius: ManagerRadius.r23,
            ),
            SizedBox(
              height: 15,
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
                    Navigator.pushReplacementNamed(context, Routes.signUpView);
                    // Navigator.pushReplacementNamed(context, Routes.signUpView);
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
