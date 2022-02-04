import 'controlbox.dart';
import 'utils.dart';
import 'package:flutter/material.dart';

int Counter = 0;

class incrementScreen extends StatefulWidget {
  const incrementScreen({Key? key}) : super(key: key);

  @override
  _incrementScreenState createState() => _incrementScreenState();
}

class _incrementScreenState extends State<incrementScreen> {
  void _incrementCounter() {
    setState(() {
      Counter++;
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
            onPressed: () => _incrementCounter(),
            child: Text("Increment", style: TextStyle(color: KbuttonTextColor)),
          ),
          MaterialButton(
            color: KbuttonColor,
            onPressed: () {
              NavKey.currentState?.pushNamed('/decrement');
            },
            child: Text("Decrement Page",
                style: TextStyle(color: KbuttonTextColor)),
          ),
        ],
      ),
    );
  }
}
