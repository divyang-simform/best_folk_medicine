import 'package:best_folk_medicine/Setting/resources.dart';
import 'counter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../Setting/utils.dart';
import 'package:flutter/material.dart';

class DecrementPage extends StatelessWidget {
  const DecrementPage({Key? key}) : super(key: key);

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
            color: kButtonColor,
            onPressed: () => _counter.decrement(),
            child: const Text("Decrement",
                style: TextStyle(color: kButtonTextColor)),
          ),
          MaterialButton(
            color: kButtonColor,
            onPressed: () {
              navKey.currentState?.pushNamed('/');
            },
            child: const Text("Increment Page",
                style: TextStyle(color: kButtonTextColor)),
          ),
        ],
      ),
    );
  }
}
