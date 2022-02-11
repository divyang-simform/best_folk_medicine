// import 'dart:html';
import 'bottomnavigation/bottomnavigationbar.dart';
import 'data_fetching/api_calling.dart';
import 'data_fetching/parsingdata.dart';
import 'homepagedata/showallarticles.dart';

import 'Flavors/app_config.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'setting/controlbox.dart';
import 'homepagedata/detail.dart';

void mainCommon() {
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return Provider(
      // builder: (_) => ApiService.create(),
      // dispose: (_ , ApiService service) => service.client.dispose(),
      create: (context) => ApiService.create(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: config!.appDisplayName,
        theme: ThemeData(
          textTheme: const TextTheme(
            headline1: TextStyle(
                color: kHeadBody1Color,
                fontWeight: FontWeight.bold,
                fontSize: 30),
            bodyText1: TextStyle(
                color: kBody1Color, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        home: const bottomBar(),
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == detailPage.detailPagedata) {
            final args = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (context) => detailPage(
                  // id: args.id,
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
      ),
    );
  }
}
