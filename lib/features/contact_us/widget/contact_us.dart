import 'package:flutter/material.dart';

import '../../../core/resources/manager_color.dart';
import '../../../core/resources/manager_sizes.dart';

class ContactInfo extends StatelessWidget {
  final String title;
  final IconData icon;
  const ContactInfo(this.title, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ManagerWidth.w10),
      child: Row(
        children: [
          Icon(
            icon,
            color: ManagerColor.oliveDrab,
          ),
          SizedBox(
            width: ManagerWidth.w5,
          ),
          Text(title)
        ],
      ),
    );
  }
}
