import 'package:flutter/material.dart';

import '../resources/manager_color.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_sizes.dart';
import '../util/size_util.dart';

class MainButton extends StatelessWidget {
  final String text;
  final double radius;
  final double width;
  final double fontSize;
  final double height;
  final Function() onPressed;

  MainButton(this.text, this.width, this.onPressed,
      {super.key, double? radius, double? fontSize, double? height})
      : radius = radius ?? SizeUtil.setRadius(ManagerRadius.r15),
        fontSize = fontSize ?? SizeUtil.setWidth(ManagerFontSize.s20),
        height = height ?? SizeUtil.setHeight(ManagerHeight.h20);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius),
            bottomLeft: Radius.circular(radius)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ManagerColor.oliveDrab,
            ManagerColor.oliveDrabDark,
          ],
        ),
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize),
          )),
    );
  }
}
