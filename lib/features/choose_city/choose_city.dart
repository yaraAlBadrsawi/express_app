import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:flutter/material.dart';

import '../../core/resources/manager_assets.dart';
import '../../core/widget/main_button.dart';
import '../../core/widget/text_field.dart';

class ChooseCityScreen extends StatefulWidget {
  const ChooseCityScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCityScreen> createState() => _ChooseCityScreenState();
}

class _ChooseCityScreenState extends State<ChooseCityScreen> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ManagerAssets.background))),
          ),
          Transform.translate(
            offset: Offset(50, -370.0),
            child: OverflowBox(
              maxHeight: double.infinity,
              maxWidth: double.infinity,
              child: Image.asset(ManagerAssets.group_7809, fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(ManagerWidth.w16),
                    child: Image.asset(ManagerAssets.logo),
                  ),
                  Padding(
                    padding: EdgeInsets.all(ManagerWidth.w16),
                    child: Text(
                      ManagerStrings.chooseCity,
                      style: TextStyle(
                          fontSize: ManagerFontSize.s20,
                          color: ManagerColor.grey,
                          fontWeight: ManagerFontWeight.bold),
                    ),
                  ),
                  Text(
                    ManagerStrings.splashSubTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ManagerFontSize.s11,
                      color: ManagerColor.grey,
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h50,
                  ),
                  TextFieldWidget(ManagerStrings.city, ManagerWidth.w47,
                      Icons.location_city),
                  SizedBox(
                    height: ManagerHeight.h40,
                  ),
                  MainButton(
                    ManagerStrings.ok,
                    ManagerWidth.w130,
                    () {},
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
