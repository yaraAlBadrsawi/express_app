import 'package:flutter/material.dart';

import '../resources/manager_color.dart';
import '../resources/manager_sizes.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final double padding;
  final IconData icon;
  final TextEditingController controller;

  const TextFieldWidget(this.controller, this.hintText, this.padding, this.icon,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(ManagerWidth.w0),
          hintText: hintText,
          hintStyle: const TextStyle(color: ManagerColor.grey),
          prefixIcon: Icon(
            icon,
            color: ManagerColor.oliveDrab,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(ManagerRadius.r15),
                bottomLeft: Radius.circular(ManagerRadius.r15),
              ),
              borderSide: const BorderSide(color: ManagerColor.oliveDrab)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(ManagerRadius.r15),
                bottomLeft: Radius.circular(ManagerRadius.r15),
              ),
              borderSide: const BorderSide(color: ManagerColor.oliveDrab)),
        ),
      ),
    );
  }
}
