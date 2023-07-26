import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/network/get_ads_api.dart';
import '../../../core/resources/manager_color.dart';
import '../view/content_model.dart';
import '../view/on_boarding.dart';

class OnBoardingController extends GetxController {
  var ads = [].obs;
  var colors = [
    ManagerColor.onBoarding1,
    ManagerColor.onBoarding3,
    ManagerColor.onBoarding2,
  ];

  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == contents.length - 1;
  var pageController = PageController();

  @override
  void onInit() {
    getAds();
    super.onInit();
  }

  void getAds() async {
    ads.value = await GetAds.getAds();
    print('ADS =>$ads');
    update();
  }

  forwardAction() {
    if (isLastPage) {
      //go to home page
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }
}
