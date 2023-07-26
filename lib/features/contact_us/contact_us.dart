import 'package:express_app/core/resources/manager_assets.dart';
import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/custom_app_bar.dart';
import 'package:express_app/core/widget/main_button.dart';
import 'package:express_app/core/widget/text_field.dart';
import 'package:express_app/features/contact_us/widget/contact_us.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconly/iconly.dart';

import '../../core/widget/raduis_white_box.dart';

class ContactUsScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _suggestController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  ContactUsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(ManagerStrings.contactUs, Icons.arrow_back_ios, () {
        Get.back();

        // Navigator.pop(context);
      }),
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
                      TextFieldWidget(_nameController, ManagerStrings.name,
                          ManagerWidth.w16, Icons.person),
                      SizedBox(
                        height: ManagerHeight.h8,
                      ),
                      TextFieldWidget(_emailController, ManagerStrings.email,
                          ManagerWidth.w16, Icons.email),
                      SizedBox(
                        height: ManagerHeight.h8,
                      ),
                      TextFieldWidget(_phoneController, ManagerStrings.phone,
                          ManagerWidth.w16, Icons.phone),
                      SizedBox(
                        height: ManagerHeight.h8,
                      ),
                      TextFieldWidget(
                          _suggestController,
                          ManagerStrings.suggestion,
                          ManagerWidth.w16,
                          Icons.settings_suggest),
                      SizedBox(
                        height: ManagerHeight.h8,
                      ),
                      TextFieldWidget(
                          _nameController, //TO DO: be aware her
                          ManagerStrings.name,
                          ManagerWidth.w16,
                          Icons.person_2_outlined),
                      SizedBox(
                        height: ManagerHeight.h8,
                      ),
                      TextFieldWidget(
                        _messageController,
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
