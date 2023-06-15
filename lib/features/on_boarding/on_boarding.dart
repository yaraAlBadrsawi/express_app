import 'package:express_app/core/resources/manager_assets.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/features/on_boarding/widget/build_dot.dart';
import 'package:express_app/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../core/resources/manager_color.dart';
import '../../core/resources/manager_strings.dart';
import 'content_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
        child: PageView.builder(
            controller: _controller,
            itemCount: contents.length,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return OnBoardingItem(
                title: contents[index].title,
                subTitle: contents[index].subTitle,
                color: contents[index].color,
                image: contents[index].image,
              );
            }),
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            contents.length,
            (index) => BuildDot(index),
          ),
        ),
      ),
    ]));
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(), // Disable scrolling

          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ManagerHeight.h206,
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
                        horizontal: ManagerWidth.w30,
                        vertical: ManagerHeight.h9),
                    child: Text(
                      subTitle,
                      style: const TextStyle(color: ManagerColor.grey),
                    ),
                  )
                ],
              ),
              Transform.translate(
                offset: const Offset(-220, 0),
                child: Image.asset(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ));
  }
}
