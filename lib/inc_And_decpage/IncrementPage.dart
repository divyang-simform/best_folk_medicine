import '../setting/resources.dart';

import 'counter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../setting/utils.dart';
import 'package:flutter/material.dart';

class incrementScreen extends StatelessWidget {
  const incrementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<Counter>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(builder: (context) {
            return Text("Counter: ${_counter.count}");
          }),
          MaterialButton(
            color: KbuttonColor,
            onPressed: () => _counter.increment(),
            child: const Text("Increment",
                style: TextStyle(color: KbuttonTextColor)),
          ),
          MaterialButton(
            color: KbuttonColor,
            onPressed: () {
              NavKey.currentState?.pushNamed('/decrement');
            },
            child: const Text("Decrement Page",
                style: TextStyle(color: KbuttonTextColor)),
          ),
        ],
      ),
    );
  }
}
