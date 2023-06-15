import 'package:express_app/core/resources/manager_color.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/manager_fonts.dart';
import '../../../core/resources/manager_sizes.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;

  const DrawerItem(
    this.title,
    this.icon,
    this.onTap, {
    super.key,
  });

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
              )
            ],
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
