import 'package:flutter/material.dart';
import 'package:flutter_mok_tabbar_example/tab_view.dart';
import 'package:mok_tabbar_view/mok_tabbar_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MokTab> tabs = [
      MokTab(title: 'Tab 1 So Long'),
      MokTab(title: 'Tab2'),
      MokTab(title: 'Tab3'),
    ];
    return MokTabBarView(
      title: Text('Mok TabView'),
      centerTitle: false,
      tabs: tabs,
      activeTextStyle: TextStyle(fontSize: 16),
      tabsView: <Widget>[
        TabView(
          tabText: 'Tab 1',
          key: Key('tab1'),
        ),
        TabView(
          tabText: 'Tab2',
          key: Key('tab2'),
        ),
        TabView(
          tabText: 'Tab3',
          key: Key('tab3'),
        )
      ],
    );
  }
}
