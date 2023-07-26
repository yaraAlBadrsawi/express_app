import 'package:express_app/core/util/size_util.dart';
import 'package:flutter/material.dart';

import '../resources/manager_color.dart';
import '../resources/manager_sizes.dart';

class Controller extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final double width;
  final double height;
  final double padding;

  Controller(this.icon, this.onPressed, this.padding,
      {double? width, double? height, Key? key})
      : width = width ?? SizeUtil.setWidth(ManagerWidth.w30),
        height = height ?? SizeUtil.setWidth(ManagerHeight.h25);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(padding), //TO DO : change it
        padding: EdgeInsets.all(ManagerWidth.w5),
        decoration: BoxDecoration(
            color: ManagerColor.oliveDrab,
            borderRadius:
                BorderRadius.only(topLeft: Radius.circular(ManagerRadius.r12))),
        width: width,
        height: height,
        child: Icon(
          icon,
          size: ManagerIconSize.s18,
          color: ManagerColor.white,
        ),
      ),
    );
  }
}
