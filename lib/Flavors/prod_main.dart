import 'package:flutter/material.dart';

import 'app_config.dart';
import '../setting/controlbox.dart';
import '../main.dart';

void main() {
  var configuredApp = AppConfig(
    appDisplayName: "Prod",
    appInternalId: 1,
    color: KbottomNavigationBarSelectedColorinprod,
    child: MyApp(),
  );

  mainCommon();

  runApp(configuredApp);
}
