import 'package:budget_tracker_ui/pages/budget_page.dart';
import 'package:budget_tracker_ui/pages/create_budge_page.dart';
import 'package:budget_tracker_ui/pages/daily_page.dart';
import 'package:budget_tracker_ui/pages/profile_page.dart';
import 'package:budget_tracker_ui/pages/stats_page.dart';
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class RootApp extends StatefulWidget {
  var rootState;
  void setRoot(var root){
    rootState=root;
  }
  void initializefragments(){
    rootState.selectedTab(rootState.pageIndex);
  }

  @override
  _RootAppState createState() => _RootAppState(this);
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  var rootApp;
  var context;
  List<Widget> pages ;

  _RootAppState(RootApp root){
    rootApp=root;
    rootApp.setRoot(this);
    this.pages = [
    DailyPage(rootApp),
    StatsPage(rootApp),
    BudgetPage(rootApp),
    ProfilePage(rootApp),
    CreatBudgetPage(rootApp)
    ];
  }
void initializefragments(){
  pages= [
    DailyPage(rootApp),
    StatsPage(rootApp),
    BudgetPage(rootApp),
    ProfilePage(rootApp),
    CreatBudgetPage(rootApp)
  ];
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.context=context;
    return Scaffold(
        body: getBody(),
        bottomNavigationBar: getFooter(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              selectedTab(4);
            },
            child: Icon(
              Icons.add,
              size: 26,
            ),
            backgroundColor: Colors.pink
            //params
            ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.md_calendar,
      Ionicons.md_stats,
      Ionicons.md_wallet,
      Ionicons.ios_person,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  void selectedTab(int index) {
    setState(() {
      pageIndex = index;
initializefragments();
    });
  }
}
