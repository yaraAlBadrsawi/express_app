import 'package:express_app/core/util/size_util.dart';
import 'package:flutter/material.dart';

import '../resources/manager_color.dart';
import '../resources/manager_sizes.dart';

class RadiusWhiteBox extends StatelessWidget {
  final double height;

  RadiusWhiteBox({
    double? height,
    super.key,
    required this.widget,
  }) : height = height ?? SizeUtil.setHeight(ManagerHeight.h427);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 335,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ManagerRadius.r20),
              topRight: Radius.circular(ManagerRadius.r20),
            ),
            color: ManagerColor.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Wrap(
            children: [widget],
          ),
        ));
  }
}
