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
            color: Colors.black,
            onPressed: () => _decrementCounter(),
            child: Text("Decrement", style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            color: Colors.black,
            onPressed: () {
              NavKey.currentState?.pushNamed('/');
              // Navigator.pushNamed(context, '/');
            },
            child:
                Text("Increment Page", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
