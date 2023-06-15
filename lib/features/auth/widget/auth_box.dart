import 'package:express_app/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/manager_assets.dart';
import '../../../core/resources/manager_color.dart';
import '../../../core/resources/manager_fonts.dart';
import '../../../core/resources/manager_sizes.dart';
import '../../../core/resources/manager_strings.dart';
import '../../../core/widget/raduis_white_box.dart';

class AuthBox extends StatelessWidget {
  final Widget widget;
  final String title;

  const AuthBox(
    this.title,
    this.widget, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                ManagerAssets.background,
              ),
              fit: BoxFit.fill)),
      child: Stack(
        children: [
          Container(
            height: ManagerHeight.h244,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      ManagerAssets.path_20529,
                    ),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: ManagerHeight.h70, left: ManagerWidth.w20),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: ManagerFontSize.s30, color: ManagerColor.white),
            ),
          ),
          TextButton(
            style:
                TextButton.styleFrom(foregroundColor: ManagerColor.oliveDrab),
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, Routes.bottomNavigationView);
            },
            child: Padding(
              padding: EdgeInsets.only(
                  top: ManagerHeight.h40,
                  left: ManagerWidth.w400,
                  right: ManagerWidth.w16),
              child: Text(
                ManagerStrings.skip,
                style: TextStyle(
                    fontSize: ManagerFontSize.s16, color: ManagerColor.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 150),
            child: Center(
              child: RadiusWhiteBox(widget: widget),
            ),
          )
        ],
      ),
    );
  }
}
