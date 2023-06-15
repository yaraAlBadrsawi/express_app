import 'package:flutter/animation.dart';

import '../../core/resources/manager_assets.dart';
import '../../core/resources/manager_color.dart';
import '../../core/resources/manager_strings.dart';

class BoardingContent {
  String title;
  String subTitle;
  Color color;
  String image;

  BoardingContent(
      {required this.image,
      required this.title,
      required this.subTitle,
      required this.color});
}

List<BoardingContent> contents = [
  BoardingContent(
    title: ManagerStrings.title,
    subTitle: ManagerStrings.splashSubTitle,
    color: ManagerColor.chineseWhite,
    image: ManagerAssets.radish,
  ),
  BoardingContent(
    title: ManagerStrings.title,
    subTitle: ManagerStrings.splashSubTitle,
    color: ManagerColor.chineseWhite,
    image: ManagerAssets.lemon,
  ),
  BoardingContent(
    title: ManagerStrings.title,
    subTitle: ManagerStrings.splashSubTitle,
    color: ManagerColor.chineseWhite,
    image: ManagerAssets.peas,
  ),
];
