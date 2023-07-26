import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/custom_app_bar.dart';
import 'package:express_app/features/fag/widget/question_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/fag_controller.dart';

class FaqScreen extends GetView<FagController> {
  FaqScreen({super.key});

  final controller = Get.put(FagController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(ManagerStrings.faq, Icons.arrow_back_ios, () {
        Get.back();
        // Navigator.pop(context);
      }),
      body: ListView.builder(
          itemCount: controller.questions.length,
          itemBuilder: (context, index) {
            return Obx(// check language first :
                () => QuestionItem(
                      controller.questions[index]['translations'][index]
                          ['question'],
                      controller.questions[index]['translations'][index]
                          ['answer'],
                    ));
          }),
    );
  }
}
