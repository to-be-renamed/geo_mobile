import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.search),
        Text("Search"),
      ],
    );
  }
}
