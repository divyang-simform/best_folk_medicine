import 'package:best_folk_medicine/Favorite/favoritepage.dart';
import 'package:best_folk_medicine/Inc_And_DecPage/increment&decrement.dart';

import '../Setting/resources.dart';
import '../Flavors/app_config.dart';
import '../shoppage/shop.dart';
import '../homepagedata/frontPage.dart';
import '../Settingpagedata/settingpage.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  String title = kFrontPageAppTitle;
  static const List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    FavoritePage(),
    ShopingPage(),
    IncrementDecrementPage(),
    SettingsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      title = kFrontPageAppTitle;
    } else if (_selectedIndex == 1) {
      title = kFavoriteAppTitle;
    } else if (_selectedIndex == 2) {
      title = kIncDecAppTitle;
    } else if (_selectedIndex == 3) {
      title = kSettingPageAppTitle;
    } else if (_selectedIndex == 4) {
      title = kSettingPageAppTitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kappBarBgcolor,
          title: Text(title, style: Theme.of(context).textTheme.headline1),
          elevation: 0.0),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                activeIcon: Icon(Icons.favorite,
                    color: kBottomNavigationBarFavoriteColor),
                label: 'Shop'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shop_outlined),
                activeIcon: Icon(Icons.shop),
                label: 'Shop'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Increment'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                activeIcon: Icon(Icons.settings),
                label: 'Settings'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: _selectedIndex == 1
              ? kBottomNavigationBarFavoriteColor
              : config!.color,
          unselectedItemColor: kBottomNavigationBarUnSelectedColor,
          onTap: _onItemTapped),
    );
  }
}
