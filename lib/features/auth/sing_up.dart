import 'package:express_app/features/auth/widget/auth_box.dart';
import 'package:flutter/material.dart';

import '../../core/resources/manager_assets.dart';
import '../../core/resources/manager_color.dart';
import '../../core/resources/manager_fonts.dart';
import '../../core/resources/manager_sizes.dart';
import '../../core/resources/manager_strings.dart';
import '../../core/widget/main_button.dart';
import '../../core/widget/text_field.dart';
import '../../routes/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
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
            TextFieldWidget(
                ManagerStrings.name, ManagerWidth.w27, Icons.person),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            TextFieldWidget(
                ManagerStrings.email, ManagerWidth.w27, Icons.email),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            TextFieldWidget(
                ManagerStrings.phone, ManagerWidth.w27, Icons.phone),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            TextFieldWidget(
                ManagerStrings.password, ManagerWidth.w27, Icons.key),
            SizedBox(
              height: ManagerHeight.h50,
            ),
            MainButton(
              ManagerStrings.signIn,
              ManagerWidth.w150,
              () {},
              radius: ManagerRadius.r23,
            ),
            SizedBox(
              height: ManagerHeight.h13,
            ),
            Text(
              ManagerStrings.termsAndPrivacy,
              style: TextStyle(
                fontWeight: ManagerFontWeight.bold,
                fontSize: ManagerFontSize.s10,
              ),
            ),
            TextButton(
              style:
                  TextButton.styleFrom(foregroundColor: ManagerColor.oliveDrab),
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.signInView);
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
