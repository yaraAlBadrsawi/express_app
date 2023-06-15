import 'package:express_app/core/resources/manager_assets.dart';
import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/custom_app_bar.dart';
import 'package:express_app/core/widget/main_button.dart';
import 'package:express_app/core/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';

import '../../core/widget/raduis_white_box.dart';
import '../auth/widget/auth_box.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(ManagerStrings.contactUse),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(ManagerAssets.background))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(ManagerWidth.w20),
                child: Text(
                  ManagerStrings.contactInfo,
                  style: TextStyle(
                      color: ManagerColor.oliveDrab,
                      fontSize: ManagerFontSize.s20),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContactInfo('email@mail.com', Icons.email_outlined),
                  ContactInfo('58962314785', Icons.phone_outlined)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ContactInfo(
                      '585465465456', Icons.phone_android_outlined),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        FontAwesomeIcons.facebookF,
                        color: ManagerColor.oliveDrab,
                      ),
                      SizedBox(
                        width: ManagerWidth.w16,
                      ),
                      const Icon(
                        FontAwesomeIcons.instagram,
                        color: ManagerColor.oliveDrab,
                      ),
                      SizedBox(
                        width: ManagerWidth.w16,
                      ),
                      const Icon(
                        FontAwesomeIcons.twitter,
                        color: ManagerColor.oliveDrab,
                      ),
                      SizedBox(
                        width: ManagerWidth.w16,
                      ),
                    ],
                  )
                ],
              ),
              Center(
                child: RadiusWhiteBox(
                  height: ManagerHeight.h484,
                  widget: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(ManagerWidth.w20),
                        child: Text(
                          ManagerStrings.contactForm,
                          style: TextStyle(
                              fontSize: ManagerFontSize.s20,
                              color: ManagerColor.oliveDrab),
                        ),
                      ),
                      TextFieldWidget(
                          ManagerStrings.name, ManagerWidth.w16, Icons.person),
                      SizedBox(
                        height: ManagerHeight.h8,
                      ),
                      TextFieldWidget(
                          ManagerStrings.email, ManagerWidth.w16, Icons.email),
                      SizedBox(
                        height: ManagerHeight.h8,
                      ),
                      TextFieldWidget(
                          ManagerStrings.phone, ManagerWidth.w16, Icons.phone),
                      SizedBox(
                        height: ManagerHeight.h8,
                      ),
                      TextFieldWidget(ManagerStrings.suggestion,
                          ManagerWidth.w16, Icons.settings_suggest),
                      SizedBox(
                        height: ManagerHeight.h8,
                      ),
                      TextFieldWidget(ManagerStrings.name, ManagerWidth.w16,
                          Icons.person_2_outlined),
                      SizedBox(
                        height: ManagerHeight.h8,
                      ),
                      TextFieldWidget(
                        ManagerStrings.message,
                        ManagerWidth.w16,
                        Icons.message_sharp,
                      ),
                      SizedBox(
                        height: ManagerHeight.h60,
                      ),
                      MainButton(
                          ManagerStrings.send, ManagerWidth.w150, () => null)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
