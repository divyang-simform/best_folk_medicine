// import 'dart:html';
import 'app_config.dart';

import 'controlbox.dart';
import 'parsingdata.dart';
import 'showallarticles.dart';
import 'package:flutter/material.dart';
import 'bottomnavigationbar.dart';
import 'detail.dart';

void mainCommon() {
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: config!.appDisplayName,
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
              color: kHeadBody1Color,
              fontWeight: FontWeight.bold,
              fontSize: 30),
          bodyText1: TextStyle(
              color: kBody1Color, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      home: const bottomBar(),
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
                time: args.time),
          );
        } else if (settings.name == showAllArticales.showArticalesdata) {
          return MaterialPageRoute(
              builder: (context) => const showAllArticales());
        }
      },
    );
  }
}
