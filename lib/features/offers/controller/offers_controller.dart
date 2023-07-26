import 'package:get/get.dart';

import '../../../core/network/offers_api.dart';

class OffersController extends GetxController {
  var offersList = <dynamic>[].obs;

  @override
  void onInit() {
    readOffers();
    super.onInit();
  }

  void readOffers() async {
    final _offersNameList = await OffersApi.getOffers();
    offersList.value = _offersNameList;
    // for (var offers in offersNameList) {
    //   offers['name'];
    // }
    print('offers name is => ${offersList[0]['translations'][0]['name']}');
    update();
  }
}
