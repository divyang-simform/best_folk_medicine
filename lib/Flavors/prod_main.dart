import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'app_config.dart';
import '../setting/controlbox.dart';
import '../main.dart';

void main() {
  var configuredApp = AppConfig(
    appDisplayName: "Prod",
    appInternalId: 1,
    color: KbottomNavigationBarSelectedColorinprod,
    child: const MyApp(),
  );
  _setupLogging();
  mainCommon();

  runApp(configuredApp);
}
void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}