library mok_tabbar_view;

import 'package:flutter/material.dart';

class MokTabLeftWrap extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double prefSize;

  const MokTabLeftWrap({Key key, this.child, this.prefSize = 55.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: child,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(prefSize);
}

class MokTabBarView extends StatefulWidget implements PreferredSizeWidget {
  final double prefSize;
  final double elevation;
  final bool centerTitle;
  final Widget title;
  final List<Widget> actions;
  final List<Widget> tabsView;
  final List<MokTab> tabs;
  final Color backgroundColor;
  final Color activeDecorationColor;
  final double activeDecorationHeight;
  final double activeDecorationWidth;
  final TextStyle activeTextStyle;
  final TextStyle normalTextStyle;

  const MokTabBarView(
      {Key key,
      this.prefSize = 55.0,
      this.elevation = 0,
      this.centerTitle = true,
      @required this.title,
      this.actions,
      this.backgroundColor,
      @required this.tabs,
      this.activeDecorationColor: Colors.red,
      this.activeDecorationHeight = 4.0,
      this.activeDecorationWidth = 25.0,
      this.activeTextStyle,
      this.normalTextStyle,
      @required this.tabsView})
      : super(key: key);

  @override
  _MokTabBarViewState createState() => _MokTabBarViewState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => null;
}

class _MokTabBarViewState extends State<MokTabBarView> {
  int _currentIndex;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: widget.centerTitle,
            elevation: widget.elevation,
            title: widget.title,
            actions: widget.actions,
            bottom: MokTabLeftWrap(
              child: TabBar(
                  tabs: List.generate(widget.tabs.length,
                      (i) => _tabView(context, widget.tabs, i)),
                  labelPadding: EdgeInsets.only(left: 0, right: 0),
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
            ),
            backgroundColor: widget.backgroundColor,
          ),
          body: TabBarView(
            children: widget.tabsView,
          )),
      length: widget.tabs.length,
    );
  }

  Widget _tabView(BuildContext context, List<MokTab> tabs, int index) {
    return Tab(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                '${tabs[index].title}',
                style: _currentIndex == index
                    ? widget.activeTextStyle ??
                        TextStyle(fontWeight: FontWeight.w700)
                    : widget.normalTextStyle ??
                        TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            _currentIndex == index
                ? Container(
                    height: widget.activeDecorationHeight,
                    width: widget.activeDecorationWidth,
                    decoration: BoxDecoration(
                        color: widget.activeDecorationColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.activeDecorationHeight))),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

class MokTab {
  String title;

  MokTab({this.title});
}
