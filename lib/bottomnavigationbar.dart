import 'increment&decrement.dart';
import 'shop.dart';

import 'frontPage.dart';
import 'settingpage.dart';
import 'textcontrolbox.dart';
import 'package:flutter/material.dart';
import 'controlbox.dart';

class bottomBar extends StatefulWidget {
  const bottomBar({Key? key}) : super(key: key);

  @override
  _bottomBarState createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  int _selectedIndex = 0;
  String title = kForntPageAppTitle;
  static const List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    ShopingPage(),
    incrementDecrementPage(),
    settingsPage()
  ];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if(_selectedIndex == 0){
      title = kForntPageAppTitle;
    }else if(_selectedIndex == 1){
      title = KShopPageAppTitle;
    }else if(_selectedIndex == 2){
      title = KInc_decAppTitle;
    } else if(_selectedIndex == 3){
      title = kSettingPageAppTitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kappBarBgcolor,
          title: Text( title ,
              style: Theme.of(context).textTheme.headline1),
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
          selectedItemColor: KbottomNavigationBarSelectedColor,
          unselectedItemColor: KbottomNavigationBarUnSelectedColor,
          onTap: _onItemTapped),
    );
  }
}
