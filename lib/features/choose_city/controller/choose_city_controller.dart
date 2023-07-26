import 'package:express_app/core/resources/manager_strings.dart';
import 'package:get/get.dart';

import '../../../core/network/get_cities_api.dart';

class ChooseCityController extends GetxController {
  var citiesList = [].obs;
  var citySelected = ManagerStrings.city;

  @override
  void onInit() {
    getCities();
    super.onInit();
  }

  void getCities() async {
    citiesList.value = await GetCitiesApi.getCities();
    print('citiesList = > $citiesList');
    update();
  }

  void changeSelectedItem(var selectedItem) {
    citySelected = selectedItem;
    print('city selected in controller => $citiesList');
    update();
  }
}
