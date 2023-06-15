import 'package:flutter/material.dart';

import '../../features/cart/cart.dart';
import '../../features/home/home_screen.dart';
import '../../features/offers/offers.dart';
import '../../features/profile/profile.dart';
import '../resources/manager_color.dart';
import '../resources/manager_sizes.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int _currentIndex = 0; // Initially selected tab index

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const OffersScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(color: ManagerColor.oliveDrab),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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
}
