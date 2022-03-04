import 'decrementPage.dart';
import 'counter.dart';
import 'package:provider/provider.dart';
import '../Setting/utils.dart';
import '../Setting/transition.dart';
import 'package:flutter/material.dart';
import 'incrementPage.dart';

int count = 0;

class IncrementDecrementPage extends StatefulWidget {
  const IncrementDecrementPage({Key? key}) : super(key: key);

  @override
  _IncrementDecrementPageState createState() => _IncrementDecrementPageState();
}

class _IncrementDecrementPageState extends State<IncrementDecrementPage> {
  @override
  Widget build(BuildContext context) {
    return Provider<Counter>(
      create: (context) => Counter(),
      child: Scaffold(
        body: Navigator(
          key: navKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            print(count);
            count++;
            switch (settings.name) {
              case '/':
                return SlideLeftRoute(page: const IncrementScreen());
              case '/decrement':
                return SlideRightRoute(page: const DecrementPage());
              default:
                return SlideLeftRoute(page: const IncrementScreen());
            }
          },
        ),
      ),
    );
  }
}
