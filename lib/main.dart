// import 'dart:html';
import 'parsingdata.dart';
import 'showallarticles.dart';
import 'package:flutter/material.dart';
import 'bottomnavigationbar.dart';
import 'detail.dart';

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
      routes: {
        showAllArticales.showArticalesdata: (context) =>
            const showAllArticales(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == detailPage.detailPagedata) {
          final args = settings.arguments as Product;
          return MaterialPageRoute(
              builder: (context) => detailPage(
                  id: args.id,
                  image: args.image,
                  title: args.title,
                  name: args.name,
                  description: args.description,
                  time: args.time));
        }
      },
    );
  }
}
