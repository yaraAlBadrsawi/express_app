import 'package:express_app/core/widget/bottom_navigation_bar.dart';
import 'package:express_app/features/auth/sing_in.dart';
import 'package:express_app/features/auth/welcome.dart';
import 'package:express_app/features/cart/cart.dart';
import 'package:express_app/features/choose_city/choose_city.dart';
import 'package:express_app/features/offers/offers.dart';
import 'package:express_app/features/on_boarding/on_boarding.dart';
import 'package:express_app/features/order/my_order.dart';
import 'package:express_app/features/order/order_details.dart';
import 'package:express_app/features/profile/edit_profile.dart';
import 'package:express_app/features/profile/profile.dart';
import 'package:express_app/features/splash/splash.dart';
import 'package:express_app/features/terms/terms.dart';
import 'package:flutter/material.dart';
import 'package:express_app/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/constants.dart';
import 'features/auth/sing_up.dart';
import 'features/contact_us/contact_us.dart';
import 'features/fag/faq.dart';
import 'features/home/home_screen.dart';
import 'features/order/open_order.dart';
import 'features/privacy_policy/privacy_policy.dart';
import 'features/search/search.dart';

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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.signInView,
            routes: {
              Routes.splashView: (context) => WelcomeScreen(),
              Routes.bottomNavigationView: (context) =>
                  BottomNavigationBarView(),
              Routes.chooseCityView: (context) => ChooseCityScreen(),
              Routes.onBoardingView: (context) => OnBoardingScreen(),
              Routes.signInView: (context) => SignInScreen(),
              Routes.signUpView: (context) => SignUpScreen(),
              Routes.homeView: (context) => HomeScreen(),
              Routes.profileView: (context) => ProfileScreen(),
              Routes.offersView: (context) => OffersScreen(),
              Routes.cartView: (context) => CartScreen(),
              Routes.editProfileView: (context) => EditProfileScreen(),
              Routes.searchView: (context) => SearchScreen(),
              Routes.orderView: (context) => OrderScreen(),
              Routes.orderDetailsView: (context) => OrderDetailsScreen(),
              Routes.termsView: (context) => TermsScreen(),
              Routes.privacyPolicyView: (context) => PrivacyPolicyScreen(),
              Routes.faqView: (context) => FaqScreen(),
              Routes.contactUsView: (context) => ContactUsScreen(),
              Routes.openOrder: (context) => OpenOrder(),
              Routes.welcomeView: (context) => WelcomeScreen(),
            },
          );
        });
  }
}
