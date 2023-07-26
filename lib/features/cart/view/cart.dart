import 'package:express_app/core/resources/manager_assets.dart';
import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/custom_app_bar.dart';
import 'package:express_app/core/widget/main_button.dart';
import 'package:express_app/features/cart/view/widget/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/widget/controller.dart';
import '../../home/widget/drawer.dart';

class CartScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  int amount = 1;

  CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: DrawerWidget(),
      appBar: CustomAppBar(ManagerStrings.myCart, Icons.menu, isCart: true, () {
        _key.currentState!.openDrawer();
      }),
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ManagerAssets.background),
                ),
              ),
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return CartItem(ManagerStrings.apple, ManagerAssets.test,
                        '500\$ /k', amount);
                  })),
          Padding(
            padding: EdgeInsets.all(ManagerWidth.w20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MainButton(
                'checkout (5)',
                ManagerWidth.w150,
                () {},
                fontSize: ManagerFontSize.s16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
