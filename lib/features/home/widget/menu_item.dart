import 'package:express_app/core/resources/manager_color.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/manager_fonts.dart';
import '../../../core/resources/manager_sizes.dart';
import '../../../core/resources/manager_strings.dart';

class DrawerItem extends StatelessWidget {
  String title;
  final IconData icon;
  final Function() onTap;
  final Widget widget;

  DrawerItem(
    this.title,
    this.icon,
    this.onTap, {
    this.widget = const Icon(Icons.arrow_forward_ios),
    super.key,
  });

  // List of items in our dropdown menu
  var items = [
    'It',
    'It',
    'It',
    'It',
    'It',
  ];
  String dropdownvalue = 'It';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: ManagerColor.oliveDrab,
              ),
              SizedBox(
                width: ManagerWidth.w15,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: ManagerFontSize.s16,
                ),
              ),
            ],
          ),
          widget
        ],
      ),
    );
  }
}
