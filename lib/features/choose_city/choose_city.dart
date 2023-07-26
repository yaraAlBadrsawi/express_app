import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/resources/manager_assets.dart';
import '../../core/widget/main_button.dart';
import '../../core/widget/text_field.dart';
import '../../routes/routes.dart';
import 'controller/choose_city_controller.dart';

class ChooseCityScreen extends GetView<ChooseCityController> {
  ChooseCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ManagerAssets.background))),
          ),
          Transform.translate(
            offset: const Offset(50, -370.0),
            child: OverflowBox(
              maxHeight: double.infinity,
              maxWidth: double.infinity,
              child: Image.asset(ManagerAssets.group_7809, fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(ManagerWidth.w16),
                    child: Image.asset(ManagerAssets.logo),
                  ),
                  Padding(
                    padding: EdgeInsets.all(ManagerWidth.w16),
                    child: Text(
                      ManagerStrings.chooseCity,
                      style: TextStyle(
                          fontSize: ManagerFontSize.s20,
                          color: ManagerColor.grey,
                          fontWeight: ManagerFontWeight.bold),
                    ),
                  ),
                  Text(
                    ManagerStrings.splashSubTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ManagerFontSize.s11,
                      color: ManagerColor.grey,
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h50,
                  ),
                  GetBuilder<ChooseCityController>(
                      init: ChooseCityController(),
                      builder: (context) {
                        return TextButton(
                          onPressed: () {
                            Get.bottomSheet(
                                isDismissible: true,
                                Container(
                                    height: ManagerHeight.h206,
                                    color: ManagerColor.white,
                                    child: controller.citiesList.isNotEmpty
                                        ? ListView.separated(
                                            itemCount:
                                                controller.citiesList.length,
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return const Divider(
                                                height: 1,
                                                color: Colors.grey,
                                              );
                                            },
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        ManagerWidth.w5),
                                                child: ListTile(
                                                    contentPadding:
                                                        EdgeInsets.all(
                                                            ManagerWidth.w0),
                                                    title: Text(
                                                      controller
                                                          .citiesList[index],
                                                      style: TextStyle(
                                                          fontSize:
                                                              ManagerFontSize
                                                                  .s14),
                                                    ),
                                                    onTap: () {
                                                      print(
                                                          'city selected  => ${controller.citiesList[index]}');
                                                      controller
                                                          .changeSelectedItem(
                                                              controller
                                                                      .citiesList[
                                                                  index]);

                                                      Get.back();
                                                    }),
                                              );
                                            })
                                        : const Center(
                                            child: CircularProgressIndicator(
                                              color: ManagerColor.oliveDrab,
                                            ),
                                          )));
                            // controller.isDropdownVisible.toggle();
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: ManagerColor.oliveDrab),
                          child: Container(
                            padding: EdgeInsets.all(ManagerWidth.w10),
                            margin: EdgeInsets.all(ManagerWidth.w25),
                            decoration: BoxDecoration(
                              color: ManagerColor.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(ManagerRadius.r15),
                                bottomLeft: Radius.circular(ManagerRadius.r15),
                              ),
                              border: Border.all(
                                color: ManagerColor
                                    .oliveDrab, // Replace this with your desired border color
                                width:
                                    1.0, // You can adjust the width of the border if needed
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_city,
                                      color: ManagerColor.oliveDrab,
                                    ),
                                    SizedBox(
                                      width: ManagerWidth.w8,
                                    ),
                                    Text(
                                      controller.citySelected,
                                      style: TextStyle(
                                          fontSize: ManagerFontSize.s16),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: ManagerColor.oliveDrab,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: ManagerHeight.h40,
                  ),
                  MainButton(
                    ManagerStrings.ok,
                    ManagerWidth.w130,
                    () {
                      if (controller.citySelected != ManagerStrings.city) {
                        Get.toNamed(Routes.onBoardingView);
                      } else {
                        Get.snackbar('city cant be empty', '',
                            backgroundColor: ManagerColor.oliveDrab,
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
