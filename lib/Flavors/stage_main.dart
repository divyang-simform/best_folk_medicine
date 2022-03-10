import 'package:hive/hive.dart';
import '../Setting/resources.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:flutter/material.dart';
import '../data_fetching/Articles.dart';
import 'app_config.dart';
import '../main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appPath = await path.getApplicationDocumentsDirectory();
  Hive.init(appPath.path);
  Hive.registerAdapter(ArticlesAdapter());
  await Hive.openBox("Favorite");
  var configuredApp = AppConfig(
    appDisplayName: "stage",
    appInternalId: 1,
    color: kBottomNavigationBarSelectedColorInDev,
    child: const MyApp(),
  );
  mainCommon();
  runApp(configuredApp);
}