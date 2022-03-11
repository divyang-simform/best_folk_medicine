import 'package:best_folk_medicine/state_management/favoritemoor.dart';
import 'package:best_folk_medicine/state_management/hivemobx.dart';
import 'state_management/favoritemobx.dart';
import 'package:provider/provider.dart';
import 'setting/resources.dart';
import 'bottomnavigation/bottomnavigationbar.dart';
import 'data_fetching/parsingdata.dart';
import 'homepagedata/showallarticles.dart';
import 'Flavors/app_config.dart';
import 'package:flutter/material.dart';
import 'homepagedata/detail.dart';

void mainCommon() {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return MultiProvider(
      providers: [
        Provider<Favorite>(create: (context) => Favorite()),
        Provider<FavoriteHive>(create: (context) => FavoriteHive()),
        Provider<FavoritesMoor>(create: (context) => FavoritesMoor()),
      ],
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
        home: const BottomBar(),
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == DetailPage.detailPagedata) {
            final args = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (context) => DetailPage(
                articles: args.articles,
                favoriteMoorData: args.favoriteMoorData,
                mode: args.mode,

              ),
            );
          } else if (settings.name == ShowAllArticales.showArticalesdata) {
            return MaterialPageRoute(
                builder: (context) => const ShowAllArticales());
          }
        },
      ),
    );
  }
}
