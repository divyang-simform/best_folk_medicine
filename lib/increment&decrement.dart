import 'package:best_folk_medicine/transition.dart';
import 'package:flutter/material.dart';

import 'DecrementPage.dart';
import 'IncrementPage.dart';
class incrementDecrementPage extends StatefulWidget {
  const incrementDecrementPage({Key? key}) : super(key: key);

  @override
  _incrementDecrementPageState createState() => _incrementDecrementPageState();
}

class _incrementDecrementPageState extends State<incrementDecrementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Navigator(
          // key:  mainListNav,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings){
            // Widget page;
            switch(settings.name){
              case '/':
                return SlideLeftRoute(page: incrementScreen());
                break;
              case '/decrement':
                return SlideRightRoute(page: decrementPage());
                break;
            };
          },
        ),
      ),
    );
  }
}
