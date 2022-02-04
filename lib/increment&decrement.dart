import 'utils.dart';
import 'transition.dart';
import 'package:flutter/material.dart';
import 'DecrementPage.dart';
import 'IncrementPage.dart';

int Count = 0;

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
          key: NavKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            print(Count);
            Count++;
            switch (settings.name) {
              case '/':
                return SlideLeftRoute(page: incrementScreen());
              case '/decrement':
                return SlideRightRoute(page: decrementPage());
              default:
                return SlideLeftRoute(page: incrementScreen());
            }
          },
        ),
      ),
    );
  }
}
