import '../Favorite/favoritepage.dart';
import '../Inc_And_DecPage/increment&decrement.dart';
import 'package:badges/badges.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../Setting/resources.dart';
import '../Flavors/app_config.dart';
import '../shoppage/shop.dart';
import '../homepagedata/frontPage.dart';
import '../Settingpagedata/settingpage.dart';
import 'package:flutter/material.dart';
import '../state_management/favoritemobx.dart';

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
    final _favorite = Provider.of<Favorite>(context);
    final config = AppConfig.of(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kappBarBgcolor,
          title: Text(title, style: Theme.of(context).textTheme.headline1),
          elevation: 0.0),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home'),
            (config?.appInternalId == 1)
                ? BottomNavigationBarItem(
                    icon: Observer(
                      builder: (context) => (_favorite.data?.isEmpty ?? true)
                          ? const Icon(Icons.favorite_border)
                          : Badge(
                              badgeContent:
                                  Text((_favorite.data?.length).toString()),
                              child: const Icon(Icons.favorite_border)),
                    ),
                    activeIcon: const Icon(Icons.favorite,
                        color: kBottomNavigationBarFavoriteColor),
                label: 'favorite'
                  )
                :
            const BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    activeIcon: Icon(Icons.favorite,
                        color: kBottomNavigationBarFavoriteColor),
                label: 'favorite'
                  ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.shop_outlined),
                activeIcon: Icon(Icons.shop),
                label: 'Shop'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.add), label: 'Increment'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                activeIcon: Icon(Icons.settings),
                label: 'Settings'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: _selectedIndex == 1
              ? kBottomNavigationBarFavoriteColor
              : config?.color,
          unselectedItemColor: kBottomNavigationBarUnSelectedColor,
          onTap: _onItemTapped),
    );
  }
}
