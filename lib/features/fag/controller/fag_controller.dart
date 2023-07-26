import 'package:get/get.dart';
import '../../../core/network/question_api.dart';

class FagController extends GetxController {
  var questions = <dynamic>[].obs;

  @override
  void onInit() {
    readQuestions();
    super.onInit();
  }

  readQuestions() async {
    final _questions = await QuestionApi.getQuestions();
    questions.value = _questions;
    print(questions);
    update();
  }
}
