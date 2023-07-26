import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/custom_app_bar.dart';
import 'package:express_app/features/offers/widget/offer_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/resources/manager_color.dart';
import '../../../core/resources/manager_sizes.dart';
import '../controller/offers_controller.dart';

class OffersScreen extends GetView<OffersController> {
  OffersScreen({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: CustomAppBar(ManagerStrings.offers, Icons.menu, () {
        _key.currentState!.openDrawer();
        // Get.back();
      }),
      body: Column(
        children: [
          Expanded(child: Obx(() {
            if (controller.offersList.isNotEmpty) {
              return GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.offersList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: ManagerHeight.h206,
                  ),
                  itemBuilder: (_, index) {
                    dynamic offer = controller.offersList;

                    // String productName = controller.products[index]['name'];
                    // print('product name  = > $productName');
                    // print(
                    //     'product image  = > ${controller.products[index]['image']}');
                    // print(
                    //     'product price  = > ${controller.products[index]['price']}');
                    return OfferItem(
                      controller.offersList[index]['translations'][index]
                          ['name'],
                      controller.offersList[index]['image'],
                      controller.offersList[index]['price'],
                      () {},
                      1,
                      controller.offersList[index]['discount'],
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
        ],
      ),
    );
  }
}
