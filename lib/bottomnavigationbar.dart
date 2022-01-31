import 'package:best_folk_medicine/settingpage.dart';
import 'package:best_folk_medicine/textcontrolbox.dart';

import 'package:flutter/material.dart';

import 'controlbox.dart';
import 'main.dart';

class bottomBar extends StatefulWidget {
  const bottomBar({Key? key}) : super(key: key);

  @override
  _bottomBarState createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    settingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Kappbarbgcolor,
          title: Text( _selectedIndex == 0 ? Kforntpageapptitle : Ksettingpageapptitle ,
              style: Theme.of(context).textTheme.headline1),
          elevation: 0.0),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'shop',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
