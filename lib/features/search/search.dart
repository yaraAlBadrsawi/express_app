import 'package:express_app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'custom_search_delegate.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    showSearch(
      context: context,
      delegate: CustomSearchDelegate(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('search', Icons.arrow_back_ios, () {
        Navigator.pop(context);
      }),
      body: Column(
        children: [],
      ),
    );
  }
}
