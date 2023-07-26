import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          ManagerStrings.termsAndConditions, Icons.arrow_back_ios, () {
        Navigator.pop(context);
      }),
      body: Column(children: [
        Text(ManagerStrings.termsAndConditions,
            style: TextStyle(
                fontSize: ManagerFontSize.s20, color: ManagerColor.oliveDrab)),
        Text('test test test , test , test test test test test tes t')
      ]),
    );
  }
}
