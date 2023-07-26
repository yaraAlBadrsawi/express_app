import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/widget/snack_bar.dart';
import 'package:express_app/features/on_boarding/widget/build_dot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/resources/manager_color.dart';
import '../../../core/resources/manager_strings.dart';
import '../controller/on_boarding_controller.dart';
import 'content_model.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  // late PageController _controller;

  int currentIndex = 0;
  // final _controller = OnBoardingController();

  final _controller = Get.put(OnBoardingController());
  OnBoardingScreen({super.key});

  // _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        PageView.builder(
            controller: _controller.pageController,
            itemCount: contents.length,
            onPageChanged: _controller.selectedPageIndex,
            itemBuilder: (context, index) {
              return Container(
                color: _controller.colors[index],
                child: Column(
                  children: [
                    Obx(() => _controller.ads.isNotEmpty
                        ? OnBoardingItem(
                            title: 'Title',
                            // _controller.ads[index]['translations']
                            //     [index]['title'],
                            subTitle: _controller.ads[index]['translations']
                                [index]['details'],
                            color: _controller.colors[index], //color
                            image: _controller.ads[index]['image'],
                          )
                        : const CircularProgressIndicator(
                            color: ManagerColor.oliveDrab,
                          )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _controller.ads.length,
                        (index) => BuildDot(index),
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h20,
                    ),
                  ],
                ),
              );
            }),
      ],
    ));
  }
}

class OnBoardingItem extends StatelessWidget {
  final Color color;
  final String title;
  final String subTitle;
  final String image;

  const OnBoardingItem({
    required this.title,
    required this.subTitle,
    required this.color,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: ManagerHeight.h20,
            ),
            Image.network(
              image,
              fit: BoxFit.fill,
              height: ManagerHeight.h50,
              width: ManagerWidth.w50,
              // ),
            ),
            Padding(
              padding: EdgeInsets.only(left: ManagerWidth.w30),
              child: Text(
                ManagerStrings.title,
                style: TextStyle(
                    fontSize: ManagerFontSize.s50,
                    fontWeight: ManagerFontWeight.bold,
                    color: ManagerColor.oliveDrab),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w30, vertical: ManagerHeight.h9),
              child: Text(
                subTitle,
                style: const TextStyle(color: ManagerColor.grey),
              ),
            ),
          ],
        ));
  }
}
