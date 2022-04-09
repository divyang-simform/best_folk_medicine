import '../setting/resources.dart';
import 'package:flutter/material.dart';
import 'app_config.dart';
import '../main.dart';

void main() {
  var configuredApp = AppConfig(
    appDisplayName: "Dev",
    appInternalId: 2,
    color: KbottomNavigationBarSelectedColorindev,
    child: const MyApp(),
  );

  mainCommon();

  runApp(configuredApp);
}
