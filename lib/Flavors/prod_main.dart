import '../Setting/resources.dart';
import 'package:flutter/material.dart';
import 'app_config.dart';
import 'package:path_provider/path_provider.dart' as path;
import '../data_fetching/articles.dart';
import 'package:hive/hive.dart';
import '../main.dart';
///chopper
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appPath = await path.getApplicationDocumentsDirectory();
  Hive.init(appPath.path);
  Hive.registerAdapter(ArticlesAdapter());
  await Hive.openBox("Favorite");
  var configuredApp = AppConfig(
    appDisplayName: "Prod",
    appInternalId: 1,
    color: kBottomNavigationBarSelectedColorInProd,
    child: const MyApp(),
  );
  mainCommon();

  runApp(configuredApp);
}
