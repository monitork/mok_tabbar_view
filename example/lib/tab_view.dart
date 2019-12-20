import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  final String tabText;

  const TabView({Key key, this.tabText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$tabText'),
    );
  }
}
