import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/main_button.dart';
import 'package:express_app/core/widget/text_field.dart';
import 'package:express_app/features/auth/widget/auth_box.dart';
import 'package:flutter/material.dart';

import '../../core/resources/manager_assets.dart';
import '../../core/resources/manager_color.dart';
import '../../core/resources/manager_sizes.dart';
import '../../core/widget/raduis_white_box.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ManagerAssets.background,
                ),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: ManagerHeight.h244,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            ManagerAssets.path_20529,
                          ),
                          fit: BoxFit.fill)),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: ManagerHeight.h120,
                    ),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: ManagerColor.grey.withOpacity(0.5),
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: ManagerColor.grey.withOpacity(0.8),
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: ManagerColor.transparent,
                          child: Image.asset(
                            ManagerAssets.profileTest,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: ManagerHeight.h120, left: ManagerWidth.w90),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      backgroundColor: ManagerColor.white,
                      child: Icon(
                        Icons.mode_edit_outline_outlined,
                        color: ManagerColor.oliveDrab,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            RadiusWhiteBox(
              height: ManagerHeight.h384,
              widget: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: ManagerHeight.h25),
                    child: Text(
                      ManagerStrings.editProfile,
                      style: TextStyle(
                          fontSize: ManagerFontSize.s20,
                          color: ManagerColor.oliveDrab,
                          fontWeight: ManagerFontWeight.bold),
                    ),
                  ),
                  TextFieldWidget(
                      ManagerStrings.userName, ManagerWidth.w8, Icons.person),
                  SizedBox(
                    height: ManagerHeight.h16,
                  ),
                  TextFieldWidget(
                      ManagerStrings.email, ManagerWidth.w8, Icons.email),
                  SizedBox(
                    height: ManagerHeight.h16,
                  ),
                  TextFieldWidget(
                      ManagerStrings.phone, ManagerWidth.w8, Icons.phone),
                  SizedBox(
                    height: ManagerHeight.h80,
                  ),
                  MainButton(ManagerStrings.save, ManagerWidth.w150, () => null)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
