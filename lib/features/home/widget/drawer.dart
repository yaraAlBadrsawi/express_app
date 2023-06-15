import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';

import '../../../core/resources/manager_assets.dart';
import '../../../core/resources/manager_color.dart';
import '../../../core/resources/manager_fonts.dart';
import '../../../core/resources/manager_sizes.dart';
import '../../../core/resources/manager_strings.dart';
import '../../../routes/routes.dart';
import 'menu_item.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  /// List of drawer item
  final List<String> _items = [
    ManagerStrings.myOrder,
    ManagerStrings.changeLanguages,
    ManagerStrings.changePassword,
    ManagerStrings.changeCountry,
    ManagerStrings.aboutUs,
    ManagerStrings.contactUse,
    ManagerStrings.shareApp,
    ManagerStrings.faq,
    ManagerStrings.termsOfUser,
    ManagerStrings.privacyPolicy,
    ManagerStrings.logOut
  ];

  /// List of drawer itme
  final List<IconData> _icons = [
    IconlyBroken.bag,
    Icons.language,
    IconlyBroken.lock,
    IconlyBroken.location,
    IconlyBroken.info_square,
    IconlyBroken.call,
    FontAwesomeIcons.shareFromSquare,
    Icons.question_mark_outlined,
    Icons.feed,
    FontAwesomeIcons.listCheck,
    IconlyBroken.logout,
  ];

  final List<String> _routes = [
    Routes.orderView,
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(ManagerAssets.menu),
              SizedBox(
                width: ManagerWidth.w47,
              ),
              Text(
                ManagerStrings.menu,
                style: TextStyle(
                    fontSize: ManagerFontSize.s20,
                    color: ManagerColor.oliveDrab),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (BuildContext context, int index) {
                return DrawerItem(_items[index], _icons[index], () {
                  if (_items[index] == ManagerStrings.contactUse) {
                    Navigator.pushReplacementNamed(
                        context, Routes.contactUsView);
                  } else if (_items[index] == ManagerStrings.myOrder) {
                    Navigator.pushReplacementNamed(context, Routes.orderView);
                  } else if (_items[index] == ManagerStrings.aboutUs) {
                    Navigator.pushReplacementNamed(context, Routes.aboutUsView);
                  } else if (_items[index] == ManagerStrings.faq) {
                    Navigator.pushReplacementNamed(context, Routes.faqView);
                  }
                });
              },
            ),
          ),
          SizedBox(
            width: ManagerWidth.w50,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(ManagerWidth.w10),
                    child: const Icon(FontAwesomeIcons.facebookF,
                        color: ManagerColor.oliveDrab),
                  ),
                  Padding(
                    padding: EdgeInsets.all(ManagerWidth.w10),
                    child: const Icon(FontAwesomeIcons.instagram,
                        color: ManagerColor.oliveDrab),
                  ),
                  Padding(
                    padding: EdgeInsets.all(ManagerWidth.w10),
                    child: const Icon(
                      FontAwesomeIcons.twitter,
                      color: ManagerColor.oliveDrab,
                    ),
                  )
                ],
              ),
              Text(ManagerStrings.poweredByHEXA),
              SizedBox(
                height: ManagerHeight.h10,
              )
            ],
          )
        ],
      ),
    ));
  }
}
