import 'package:express_app/core/resources/manager_color.dart';
import 'package:flutter/material.dart';

class BuildDot extends StatelessWidget {
  final int index;

  const BuildDot(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 20,
      // width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ManagerColor.oliveDrabDark,
      ),
    );
  }
}
