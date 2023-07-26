// try to use get

import 'package:express_app/core/resources/manager_assets.dart';
import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/features/home/controller/home_controller.dart';
import 'package:express_app/features/home/widget/drawer.dart';
import 'package:express_app/features/home/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/network/categories_api.dart';
import '../../core/resources/manager_strings.dart';
import '../../routes/routes.dart';
import '../cart/view/cart.dart';
import '../search/custom_search_delegate.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  // HomeController controller = Get.put(HomeController());
  int current = 0;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: DrawerWidget(),
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return SafeArea(
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
                            _key.currentState?.openDrawer();
                          },
                          child: const Icon(
                            Icons.menu,
                            color: ManagerColor.oliveDrab,
                          ),
                        ),
                        Center(
                          child: Text(
                            ManagerStrings.home.tr,
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
                            //TODO : Search
                            controller.showSearch(context);

                            // showSearch(
                            //   context: context,
                            //   delegate: CustomSearchDelegate(),
                            // );
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
                          child: controller.categoryList.isNotEmpty
                              ? ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: controller.categoryList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    return Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              // current = index;
                                              controller.readData();

                                              controller.setCurrentIndex(index);

                                              controller
                                                  .getProduct(); // Call the setProductList() method

                                              // });
                                            },
                                            child: IntrinsicWidth(
                                                child: AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: ManagerWidth.w4,
                                                  horizontal: ManagerWidth.w8),
                                              margin: EdgeInsets.all(
                                                  ManagerWidth.w2),
                                              decoration: BoxDecoration(
                                                  color: controller.currentIndex
                                                              .value ==
                                                          index
                                                      ? ManagerColor.oliveDrab
                                                      : ManagerColor.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          ManagerRadius.r30)),
                                              child: Center(child:
                                                  // print(
                                                  //     '<<<is loading value => ${controller.isLoading.value} >>>.');

                                                  // print(
                                                  //     'categoryies list in view =>>>>>>>>> ${controller.categoryList[index]}');

                                                  // return controller.isLoading.value
                                                  //     ? const Center(
                                                  //         child:
                                                  //             CircularProgressIndicator(
                                                  //           color: ManagerColor.oliveDrab,
                                                  //         ),
                                                  //       )
                                                  //     :
                                                  Obx(() {
                                                return Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          ManagerWidth.w8),
                                                      child: ColorFiltered(
                                                        colorFilter: controller
                                                                    .currentIndex
                                                                    .value ==
                                                                index
                                                            ? const ColorFilter
                                                                    .mode(
                                                                Colors.white,
                                                                BlendMode
                                                                    .srcATop)
                                                            : const ColorFilter
                                                                .matrix(<double>[
                                                                1,
                                                                0,
                                                                0,
                                                                0,
                                                                0, // Red channel
                                                                0,
                                                                1,
                                                                0,
                                                                0,
                                                                0, // Green channel
                                                                0,
                                                                0,
                                                                1,
                                                                0,
                                                                0, // Blue channel
                                                                0,
                                                                0,
                                                                0,
                                                                1,
                                                                0, // Alpha channel
                                                              ]),
                                                        child: Image.network(
                                                          controller
                                                                  .categoryImageList[
                                                              index],
                                                          width:
                                                              ManagerWidth.w20,
                                                          height:
                                                              ManagerHeight.h20,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      controller
                                                          .categoryList[index],
                                                      style: TextStyle(
                                                          fontSize:
                                                              ManagerFontSize
                                                                  .s16,
                                                          color: controller
                                                                      .currentIndex
                                                                      .value ==
                                                                  index
                                                              ? Colors.white
                                                              : ManagerColor
                                                                  .oliveDrab),
                                                    )
                                                  ],
                                                );
                                              })),
                                            ))),
                                        Visibility(
                                            visible:
                                                controller.currentIndex.value ==
                                                    index,
                                            child: Container(
                                              width: ManagerWidth.w5,
                                              height: ManagerHeight.h5,
                                              decoration: BoxDecoration(
                                                  color: ManagerColor.oliveDrab,
                                                  shape: BoxShape.circle),
                                            ))
                                      ],
                                    );
                                  })
                              : const Center(
                                  child: CircularProgressIndicator(
                                  color: ManagerColor.oliveDrab,
                                )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Obx(() {
                    if (controller.products.isNotEmpty) {
                      return GridView.builder(
                          shrinkWrap: true,
                          itemCount: controller.products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: ManagerHeight.h206,
                          ),
                          itemBuilder: (_, index) {
                            dynamic product = controller.productList;

                            String productName =
                                controller.products[index]['name'];
                            print('product name  = > $productName');
                            print(
                                'product image  = > ${controller.products[index]['image']}');
                            print(
                                'product price  = > ${controller.products[index]['price']}');
                            return ProductItem(
                              controller.products[index]['name'],
                              controller.products[index]['image'],
                              controller.products[index]['price'],
                              () {},
                              1,
                            );
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ManagerColor.oliveDrab,
                        ),
                      );
                    }
                  }))
                ]),
              ),
            ));
          }),
    );
  }
}
