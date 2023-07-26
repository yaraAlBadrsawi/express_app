import 'package:express_app/core/widget/dialog_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../core/network/categories_api.dart';

class HomeController extends GetxController {
  RxInt selectIndex = 0.obs;
  RxInt currentIndex = 1.obs;
  var categoryList = <String>[].obs;
  var categoryImageList = <String>[].obs;
  var productList = <dynamic>[].obs;
  var products = <dynamic>[].obs;

  static const String defaultLanguage = 'EN';
  final RxString _selectedLanguage = RxString(defaultLanguage);

  String get selectedLanguage => _selectedLanguage.value;

  @override
  void onInit() {
    readData();
    getProduct();
    // _loadLanguage();

    super.onInit();
  }

  @override
  void onReady() {
    readData();
    getProduct();

    super.onReady();
  }

  void setCurrentIndex(int index) {
    currentIndex.value = index;
    update();
  }

  void openDrawer() {
    final scaffoldState = Get.key.currentState as ScaffoldState;
    scaffoldState.openDrawer();
    update();
  }

  void showSearch(BuildContext context) {
    //   showSearch(
    //     // context: context,
    //     // delegate: CustomSearchDelegate(),
    //   );
  }

  readData() async {
    var categories = await CategoriesApi.readCategories();
    var categoriesImage = await CategoriesApi.readCategoriesImage();
    categoryList.value = categories;
    categoryImageList.value = categoriesImage;
    update();
  }

  getProduct() async {
    //Future<List<dynamic>>
    print('current index ==>> $currentIndex');
    final _productList =
        await CategoriesApi.readProductByCategories(currentIndex);
    products.value = _productList;
    // print('products => $_productList');
    update();

    // update();
    // return products;
  }

  Future<void> changeLanguage(var languageCode) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString('language_code', languageCode);
    _selectedLanguage.value = languageCode;
    update();
  }
}
