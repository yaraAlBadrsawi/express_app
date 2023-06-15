import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(ManagerStrings.faq),
      body: Column(
        children: [
          QuestionItem('What is store? ',
              'Contrary to popular belief, Lorem Ipsum is not simply rand text. It has roots in a piece of classical Latin literature from 45 BC, making '),
          QuestionItem('What is store? ',
              'Contrary to popular belief, Lorem Ipsum is not simply rand text. It has roots in a piece of classical Latin literature from 45 BC, making '),
          QuestionItem('What is store? ',
              'Contrary to popular belief, Lorem Ipsum is not simply rand text. It has roots in a piece of classical Latin literature from 45 BC, making ')
        ],
      ),
    );
  }
}

class QuestionItem extends StatelessWidget {
  final String question;
  final String answer;

  const QuestionItem(
    this.question,
    this.answer, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'what is store? ',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: ManagerColor.oliveDrab, fontSize: ManagerFontSize.s20),
            ),
            SizedBox(
              height: ManagerHeight.h10,
            ),
            Text(answer)
          ],
        )
      ],
    );
  }
}
