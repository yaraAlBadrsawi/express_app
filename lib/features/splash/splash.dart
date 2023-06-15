import 'package:express_app/core/resources/manager_color.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../core/resources/manager_assets.dart';
import '../../core/resources/manager_fonts.dart';
import '../../core/resources/manager_sizes.dart';
import '../../core/resources/manager_strings.dart';
import '../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: Constants.splashDuration), () {
      Navigator.pushReplacementNamed(
          context, Routes.chooseCityView); //login_screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ManagerAssets.splash), fit: BoxFit.fill)),
      child: Column(
        children: [
          SizedBox(
            height: ManagerHeight.h91,
          ),
          Padding(
            padding: EdgeInsets.only(right: ManagerWidth.w89),
            child: Image.asset(
              ManagerAssets.logo,
              width: ManagerWidth.w186,
              height: ManagerHeight.h58,
            ),
          ),
          Text(
            ManagerStrings.splashSubTitle,
            style: TextStyle(
                fontSize: ManagerFontSize.s11, color: ManagerColor.grey),
          ),
          Container()
        ],
      ),

      //
    ));
  }
}
