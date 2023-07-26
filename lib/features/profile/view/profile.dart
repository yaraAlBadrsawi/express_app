import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/main_button.dart';
import 'package:express_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/resources/manager_assets.dart';
import '../../../core/resources/manager_sizes.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                ManagerAssets.background,
              ),
              fit: BoxFit.fill)),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: ManagerHeight.h244,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          ManagerAssets.path_20529,
                        ),
                        fit: BoxFit.fill)),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: ManagerHeight.h45,
                  ),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: ManagerColor.grey.withOpacity(0.5),
                    child: CircleAvatar(
                      radius: 75,
                      backgroundColor: ManagerColor.grey.withOpacity(0.8),
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: ManagerColor.transparent,
                        child: Image.asset(
                          ManagerAssets.profileTest,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(vertical: ManagerHeight.h25),
              child: controller.name.value.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: ManagerColor.oliveDrab,
                    ))
                  : Text(
                      controller.name.value,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ManagerColor.oliveDrab,
                          fontSize: ManagerIconSize.s24),
                    ),
            ),
          ),
          PersonalInformation(ManagerStrings.email.tr, controller.email.value),
          PersonalInformation(ManagerStrings.phone.tr, controller.mobile.value),
          SizedBox(
            height: ManagerHeight.h80,
          ),
          MainButton(
            ManagerStrings.editProfile,
            ManagerWidth.w150,
            height: ManagerHeight.h40,
            fontSize: ManagerFontSize.s16,
            () {
              print('language ');
              Get.toNamed(Routes.editProfileView);
            },
          )
        ],
      ),
    ));
  }
}

class PersonalInformation extends GetView<ProfileController> {
  final String title;
  final String data;

  const PersonalInformation(this.title, this.data, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ManagerWidth.w16),
      margin: EdgeInsets.all(ManagerWidth.w8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(ManagerRadius.r20),
              bottomLeft: Radius.circular(ManagerRadius.r20)),
          color: ManagerColor.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.email,
                color: ManagerColor.oliveDrab,
              ),
              SizedBox(
                width: ManagerWidth.w20,
              ),
              Text(
                title.tr,
                style: TextStyle(
                    fontSize: ManagerFontSize.s14,
                    fontWeight: FontWeight.bold,
                    color: ManagerColor.oliveDrab),
              ),
            ],
          ),
          data.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                  color: ManagerColor.oliveDrab,
                ))
              : Text(
                  data.tr,
                  style: TextStyle(
                      fontSize: ManagerFontSize.s16, color: ManagerColor.grey),
                ),
        ],
      ),
    );
  }
}
