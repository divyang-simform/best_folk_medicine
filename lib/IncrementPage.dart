import 'package:best_folk_medicine/DecrementPage.dart';
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
            color: Colors.black,
            onPressed: () => _incrementCounter(),
            child: Text("Increment", style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            color: Colors.black,
            onPressed: () { Navigator.pushNamed(context, '/decrement'); },
            child: Text("Decrement Page", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
