import 'dart:convert';

// import 'dart:html';
import 'card.dart';
import 'detail.dart';
import 'row.dart';
import 'search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bottomnavigationbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          bodyText1: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      home: const bottomBar(),
    );
  }
}


