import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/main_button.dart';
import 'package:express_app/routes/routes.dart';
import 'package:flutter/material.dart';
import '../../core/resources/manager_assets.dart';
import '../../core/resources/manager_color.dart';
import '../../core/resources/manager_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ManagerAssets.background),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ManagerStrings.welcome,
              style: TextStyle(
                  fontSize: ManagerFontSize.s30, color: ManagerColor.oliveDrab),
            ),
            Text(
              ManagerStrings.thanks,
              textAlign: TextAlign.center,
            ),
            Stack(children: [
              Transform.translate(
                  offset: const Offset(0, 100),
                  child: Image.asset(ManagerAssets.welcome)),
              Align(
                alignment: Alignment.bottomCenter,
                child: MainButton(
                  ManagerStrings.home,
                  ManagerWidth.w130,
                  () {
                    print('clicked ');
                    Navigator.pushReplacementNamed(
                        context, Routes.bottomNavigationView);
                  },
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
