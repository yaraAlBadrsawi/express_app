import 'package:express_app/core/resources/manager_assets.dart';
import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/widget/main_button.dart';
import 'package:express_app/features/home/widget/drawer.dart';
import 'package:express_app/features/home/widget/product_item.dart';
import 'package:express_app/features/offers/offers.dart';
import 'package:express_app/features/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';

import '../../core/resources/manager_strings.dart';
import '../../routes/routes.dart';
import '../cart/cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// List of Tab Bar Item
  List<String> items = [
    ManagerStrings.vegetables,
    ManagerStrings.fruits,
    ManagerStrings.meat,
    ManagerStrings.papers,
  ];

  /// List of body icon
  List<IconData> icons = [
    FontAwesomeIcons.paragraph,
    Icons.explore,
    Icons.search,
    Icons.feed,
  ];

  int current = 0;

  String productName = 'test name'; // test
  String productImage = ManagerAssets.test; // test
  String productPrice = '5.00\$ /k '; // test

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: const DrawerWidget(),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ManagerAssets.background),
              ),
            ),
            child: Expanded(
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ManagerHeight.h10,
                      horizontal: ManagerWidth.w10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: ManagerColor.oliveDrab),
                        onPressed: () {
                          // openDrawer
                          _key.currentState?.openEndDrawer();
                        },
                        child: const Icon(
                          Icons.menu,
                          color: ManagerColor.oliveDrab,
                        ),
                      ),
                      Center(
                        child: Text(
                          ManagerStrings.home,
                          style: TextStyle(
                              fontSize: ManagerFontSize.s20,
                              fontWeight: ManagerFontWeight.bold,
                              color: ManagerColor.oliveDrab),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: ManagerColor.oliveDrab),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.searchView);
                        },
                        child: Container(
                          height: ManagerHeight.h28,
                          width: ManagerWidth.w70,
                          decoration: BoxDecoration(
                              color: ManagerColor.silver,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(ManagerRadius.r14))),
                          child: Icon(
                            Icons.search,
                            color: ManagerColor.oliveDrab,
                            size: ManagerIconSize.s18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Custom TabBar
                      SizedBox(
                        width: double.infinity,
                        height: ManagerHeight.h60,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: items.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                    child: IntrinsicWidth(
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        padding: EdgeInsets.symmetric(
                                            vertical: ManagerWidth.w4,
                                            horizontal: ManagerWidth.w8),
                                        margin: EdgeInsets.all(ManagerWidth.w2),
                                        decoration: BoxDecoration(
                                            color: current == index
                                                ? ManagerColor.oliveDrab
                                                : Colors.white54,
                                            borderRadius:
                                                BorderRadius.circular(30)

                                            // border: current == index
                                            //     ? Border.all(
                                            //         color: Colors.deepPurpleAccent,
                                            //         width: 2)
                                            //     : null,
                                            ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(
                                                    ManagerWidth.w8),
                                                child: Icon(
                                                  icons[index],
                                                  color: current == index
                                                      ? ManagerColor.white
                                                      : ManagerColor.oliveDrab,
                                                ),
                                              ),
                                              Text(items[index],
                                                  style: TextStyle(
                                                      fontSize:
                                                          ManagerFontSize.s16,
                                                      color: current == index
                                                          ? Colors.white
                                                          : ManagerColor
                                                              .oliveDrab)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                      visible: current == index,
                                      child: Container(
                                        width: ManagerWidth.w5,
                                        height: ManagerHeight.h5,
                                        decoration: const BoxDecoration(
                                            color: ManagerColor.oliveDrab,
                                            shape: BoxShape.circle),
                                      ))
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      // shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (_, index) {
                        return ProductItem(
                            productName, productImage, productPrice, () {});
                      }),
                )
              ]),
            ),
          ),
        ));
  }
}
