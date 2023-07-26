import 'package:express_app/features/auth/sing_in.dart';
import 'package:express_app/features/auth/sing_up.dart';
import 'package:express_app/features/choose_city/choose_city.dart';
import 'package:express_app/features/home/home_screen.dart';
import 'package:express_app/features/offers/view/offers.dart';
import 'package:express_app/features/on_boarding/view/on_boarding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../features/fag/binding/fag_binding.dart';
import '../features/home/bottom_naviagtion/binding/bottom_navigation_binding.dart';
import '../features/home/bottom_naviagtion/view/bottom_navigation_bar.dart';
import '../features/auth/binding/sign_in_binding.dart';
import '../features/auth/binding/sign_up_binding.dart';
import '../features/choose_city/binding/choose_city_binding.dart';
import '../features/home/binding/home_binding.dart';
import '../features/auth/welcome.dart';
import '../features/cart/view/cart.dart';
import '../features/contact_us/contact_us.dart';
import '../features/fag/view/faq.dart';
import '../features/offers/binding/offers_binding.dart';
import '../features/on_boarding/binding/on_boarding_binding.dart';
import '../features/order/open_order.dart';
import '../features/order/order_details.dart';
import '../features/privacy_policy/privacy_policy.dart';
import '../features/profile/binding/edit_profile_binding.dart';
import '../features/profile/binding/profile_binding.dart';
import '../features/profile/view/edit_profile.dart';
import '../features/profile/view/profile.dart';
import '../features/search/search.dart';
import '../features/splash/binding/splash_binding.dart';
import '../features/splash/view/splash.dart';
import '../features/terms/terms.dart';

class Routes {
  static const String splashView = '/splash';
  static const String homeView = '/home_screen';
  static const String chooseCityView = '/choose_city';
  static const String onBoardingView = '/on_boarding';
  static const String signInView = '/sign_in';
  static const String signUpView = '/sign_up';
  static const String profileView = '/profile';
  static const String offersView = '/offers';
  static const String cartView = '/cart';
  static const String bottomNavigationView = '/bottom_navigation';
  static const String editProfileView = '/edit_profile';
  static const String searchView = '/search';
  static const String orderView = '/order';
  static const String orderDetailsView = '/order_details';
  static const String termsView = '/terms';
  static const String privacyPolicyView = '/privacy_policy';
  static const String faqView = '/faq';
  static const String contactUsView = '/contact_us';
  static const String openOrder = '/openOrder';
  static const String completedOrder = '/contact_us';
  static const String aboutUsView = '/about_us';
  static const String welcomeView = '/welcome';

  static final routes = [
    GetPage(
        name: Routes.splashView,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(
      name: Routes.signInView,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.signUpView,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
        name: Routes.bottomNavigationView,
        page: () => BottomNavigationBarView(),
        binding: BottomNavigationBinding()),
    GetPage(
        name: Routes.chooseCityView,
        page: () => ChooseCityScreen(),
        binding: ChooseCityBinding()),
    GetPage(
        name: Routes.onBoardingView,
        page: () => OnBoardingScreen(),
        binding: OnBoardingBinding()),
    GetPage(
        name: Routes.homeView,
        page: () => HomeScreen(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.profileView,
        page: () => ProfileScreen(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.offersView,
        page: () => OffersScreen(),
        binding: OffersBinding()),
    GetPage(name: Routes.cartView, page: () => CartScreen()),
    GetPage(
        name: Routes.editProfileView,
        page: () => EditProfileScreen(),
        binding: EditProfileBinding()),
    GetPage(name: Routes.searchView, page: () => const SearchScreen()),
    GetPage(
        name: Routes.orderDetailsView, page: () => const OrderDetailsScreen()),
    GetPage(name: Routes.termsView, page: () => const TermsScreen()),
    GetPage(
        name: Routes.privacyPolicyView,
        page: () => const PrivacyPolicyScreen()),
    GetPage(
      name: Routes.faqView,
      page: () => FaqScreen(),
      binding: FagBinding(),
    ),
    GetPage(name: Routes.contactUsView, page: () => ContactUsScreen()),
    GetPage(name: Routes.openOrder, page: () => const OpenOrder()),
    GetPage(name: Routes.welcomeView, page: () => const WelcomeScreen()),
  ];
}
