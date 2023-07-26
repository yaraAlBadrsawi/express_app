import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:flutter/material.dart';

import '../resources/manager_color.dart';
import '../resources/manager_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function() action;
  final IconData? icon;
  final bool isCart;
  final double? total;

  // final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  const CustomAppBar(this.title, this.icon, this.action,
      {this.isCart = false, this.total, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: TextButton(
        style: TextButton.styleFrom(foregroundColor: ManagerColor.white),
        onPressed: action,
        child: Icon(icon),
      ),
      actions: [
        Center(
            child:
                Text(isCart ? '${ManagerStrings.total} $total \$      ' : '')),
      ],
      elevation: 0,
      backgroundColor: ManagerColor.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(ManagerRadius.r15),
              bottomRight: Radius.circular(ManagerRadius.r15)),
          gradient: const LinearGradient(colors: [
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
