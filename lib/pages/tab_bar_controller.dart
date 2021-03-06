import 'package:angel_app/pages/community/community_page.dart';
import 'package:angel_app/pages/home/home_page.dart';
import 'package:angel_app/pages/map/map_page.dart';
import 'package:angel_app/pages/tabs/tabs_page.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:flutter/material.dart';

class TabBarController extends StatefulWidget {
  @override
  _TabBarControllerState createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {

  PageController pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );
  List<Widget> _bodyWidgets = [HomePage(), MapPage(), TabsPage()];
  int _currTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[HomePage(), MapPage(), TabsPage()],
      ),
      backgroundColor: currBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currTab,
        backgroundColor: currCardColor,
        selectedItemColor: mainColor,
        unselectedItemColor: mainColor.withOpacity(0.4),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _currTab = index;
          });
          pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Community"
          ),
        ],
      ),
    );
  }
}
