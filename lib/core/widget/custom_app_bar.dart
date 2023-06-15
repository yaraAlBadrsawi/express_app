import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:flutter/material.dart';

import '../resources/manager_color.dart';
import '../resources/manager_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: TextButton(
          style: TextButton.styleFrom(foregroundColor: ManagerColor.white),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios)),
      elevation: 0,
      backgroundColor: ManagerColor.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(ManagerRadius.r15),
              bottomRight: Radius.circular(ManagerRadius.r15)),
          gradient: LinearGradient(colors: [
            ManagerColor.oliveDrab,
            ManagerColor.oliveDrabDark,
          ]),
        ),
      ),
      title: Text(
        title,
        style:
            TextStyle(fontSize: ManagerFontSize.s20, color: ManagerColor.white),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
