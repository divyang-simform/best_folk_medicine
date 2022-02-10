import 'controlbox.dart';

import 'IncrementPage.dart';
import 'utils.dart';
import 'package:flutter/material.dart';

class decrementPage extends StatefulWidget {
  const decrementPage({Key? key}) : super(key: key);

  @override
  _decrementPageState createState() => _decrementPageState();
}

class _decrementPageState extends State<decrementPage> {
  void _decrementCounter() {
    setState(() {
      Counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Counter: $Counter"),
          MaterialButton(
            color: KbuttonColor,
            onPressed: () => _decrementCounter(),
            child: Text("Decrement", style: TextStyle(color: KbuttonTextColor)),
          ),
          MaterialButton(
            color: KbuttonColor,
            onPressed: () {
              NavKey.currentState?.pushNamed('/');
            },
            child: Text("Increment Page",
                style: TextStyle(color: KbuttonTextColor)),
          ),
        ],
      ),
    );
  }
}
