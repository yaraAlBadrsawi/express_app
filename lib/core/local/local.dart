import 'package:express_app/core/resources/manager_strings.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import '../util/local/ar.dart';
import '../util/local/en.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {ManagerStrings.en: en, ManagerStrings.ar: ar};
}
