import 'package:flutter/material.dart';
import 'package:express_app/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'config/constants.dart';
import 'core/local/local.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        splitScreenMode: true,
        minTextAdapt: true,
        designSize: const Size(
          Constants.deviceWidth,
          Constants.deviceHeight,
        ),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            fallbackLocale: Locale('en', 'ar'),
            initialRoute: Routes.splashView,
            getPages: Routes.routes,
            translations: Translation(),
            locale: Get.deviceLocale,
            // supportedLocales: [
            //   const Locale(ManagerStrings.en, 'US'),
            //   const Locale(ManagerStrings.ar, 'AR'),
            //   // Add more locales if needed
            // ],
          );
        });
  }
}
