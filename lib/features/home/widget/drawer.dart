import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../core/resources/manager_assets.dart';
import '../../../core/resources/manager_color.dart';
import '../../../core/resources/manager_fonts.dart';
import '../../../core/resources/manager_sizes.dart';
import '../../../core/resources/manager_strings.dart';
import '../../../routes/routes.dart';
import '../controller/home_controller.dart';
import 'menu_item.dart';

class DrawerWidget extends GetView<HomeController> {
  /// List of drawer item

  final List<String> _items = [
    ManagerStrings.myOrder,
    ManagerStrings.changeLanguages,
    ManagerStrings.changePassword,
    ManagerStrings.changeCountry,
    ManagerStrings.aboutUs,
    ManagerStrings.contactUs,
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

  final _controller = Get.put(HomeController());

  final List<String> _routes = [
    Routes.orderView,
  ];

  String selectedLanguage = 'en'; // Default language is English
// List of items in our dropdown menu
  var languages = [
    'EN',
    'AR',
  ];

  String dropdownvalue = 'AR';

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
                  print('item => ${_items[index]}');
                  if (_items[index] == ManagerStrings.changeLanguages) {
                    return Obx(
                        () => DrawerItem(_items[index], _icons[index], () {},
                            widget: DropdownButton(
                                value: controller.selectedLanguage,
                                items: languages.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  controller.changeLanguage(value);
                                  print(
                                      'Selected language: ${controller.selectedLanguage}');
                                  Get.updateLocale(Locale(selectedLanguage));
                                })));
                  } else {
                    return DrawerItem(_items[index], _icons[index], () {
                      if (_items[index] == ManagerStrings.contactUs) {
                        Get.toNamed(Routes.contactUsView);
                      } else if (_items[index] == ManagerStrings.myOrder) {
                        Get.toNamed(Routes.orderView);
                      } else if (_items[index] == ManagerStrings.aboutUs) {
                        Get.toNamed(Routes.aboutUsView);
                      } else if (_items[index] == ManagerStrings.faq) {
                        Get.toNamed(Routes.faqView);
                      }
                      // else if (_items[index] ==
                      //     ManagerStrings.changeLanguages) {
                      //   changeLanguage(_items[index]);
                      //   //change language
                      // }
                    });
                  }
                }),
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
              const Text(ManagerStrings.poweredByHEXA),
              SizedBox(
                height: ManagerHeight.h10,
              )
            ],
          )
        ],
      ),
    ));
  }

  void changeLanguage(String text) {
    // text ==  ManagerStrings.changeLanguages ?
  }
}
