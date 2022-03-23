import '../Animations/animation_page.dart';
import '../Favorite/favoritepage.dart';
import '../Inc_And_DecPage/increment_and_decrement.dart';
import 'package:badges/badges.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../Setting/resources.dart';
import '../Flavors/app_config.dart';
import '../shoppage/shop.dart';
import '../homepagedata/front_page.dart';
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
    AnimationPage(),
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
      title = kShopPageAppTitle;
    } else if (_selectedIndex == 3) {
      title = kIncDecAppTitle;
    } else if (_selectedIndex == 4) {
      title = kAnimationPageAppTitle;
    } else if (_selectedIndex == 5) {
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
                icon: Icon(kBottomNavigationbarHomeIcon),
                activeIcon: Icon(kBottomNavigationbarHomeSelectedIcon),
                label: 'Home'),
            (config?.appInternalId == 1)
                ? BottomNavigationBarItem(
                    icon: Observer(
                      builder: (context) => (_favorite.data?.isEmpty ?? true)
                          ? const Icon(kBottomNavigationbarFavoriteIcon)
                          : Badge(
                              badgeContent:
                                  Text((_favorite.data?.length).toString()),
                              child:
                                  const Icon(kBottomNavigationbarFavoriteIcon)),
                    ),
                    activeIcon: const Icon(
                        kBottomNavigationbarFavoriteSelectedIcon,
                        color: kBottomNavigationBarFavoriteColor),
                    label: 'favorite')
                : const BottomNavigationBarItem(
                    icon: Icon(kBottomNavigationbarFavoriteIcon),
                    activeIcon: Icon(kBottomNavigationbarFavoriteSelectedIcon,
                        color: kBottomNavigationBarFavoriteColor),
                    label: 'favorite'),
            const BottomNavigationBarItem(
                icon: Icon(kBottomNavigationbarShopIcon),
                activeIcon: Icon(kBottomNavigationbarShopSelectedIcon),
                label: 'Shop'),
            const BottomNavigationBarItem(
                icon: Icon(kBottomNavigationbarIncrementIcon),
                label: 'Increment'),
            const BottomNavigationBarItem(
                icon: Icon(kBottomNavigationbarAnimationIcon),
                label: 'Animation'),
            const BottomNavigationBarItem(
                icon: Icon(kBottomNavigationbarSettingIcon),
                activeIcon: Icon(kBottomNavigationbarSettingSelectedIcon),
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
