import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../cart/view/cart.dart';
import '../../../profile/view/profile.dart';
import '../../home_screen.dart';
import '../../../offers/view/offers.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../controller/bottom_navigation_controller.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  final int _currentIndex = 0; // Initially selected tab index

  final List<Widget> _screens = [
    HomeScreen(),
    ProfileScreen(),
    OffersScreen(),
    CartScreen(),
  ];

  BottomNavigationBarView({super.key});

  buildBottomNavigationMenu(context) {
    return Obx(
      () => BottomNavigationBar(
        selectedIconTheme: const IconThemeData(color: ManagerColor.oliveDrab),
        currentIndex: controller.tabIndex.value,
        onTap: (index) => controller.changeTabIndex(index),
        unselectedIconTheme: const IconThemeData(color: ManagerColor.grey),
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home_outlined, size: ManagerIconSize.s24)),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.person_2_outlined,
                size: ManagerIconSize.s24,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.local_offer_outlined,
                size: ManagerIconSize.s24,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.shopping_cart_outlined,
                  size: ManagerIconSize.s24)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: _screens[_currentIndex],
        body: Obx(() => IndexedStack(
              index: controller.tabIndex.value,
              children: [
                // _screens[controller.tabIndex.value]

                HomeScreen(),
                ProfileScreen(),
                OffersScreen(),
                CartScreen(),
              ],
            )),
        bottomNavigationBar: buildBottomNavigationMenu(context));
  }
}
