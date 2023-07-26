import 'package:flutter/material.dart';

import '../../core/resources/manager_color.dart';
import '../../core/resources/manager_sizes.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  Widget buildSearchBar(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        contentPadding: EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.blue, // Customize the border color if needed
            width: 2.0,
          ),
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: ManagerColor.red,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Perform the search and display the results
    // Return a widget that represents the search results
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Display suggestions as the user types in the search field
    // Return a widget that represents the search suggestions
    return Container(
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(ManagerRadius.r20)));
  }
}
