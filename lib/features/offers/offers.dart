import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(ManagerStrings.offers),
      body: Column(
        children: [],
      ),
    );
  }
}
