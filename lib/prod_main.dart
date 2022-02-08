
import 'package:flutter/material.dart';

import 'app_config.dart';
import 'main.dart';

void main() {
  var configuredApp = AppConfig(
    appDisplayName: "Prod",
    appInternalId: 1,
    color: Colors.grey,
    child: MyApp(),
  );

  mainCommon();

  runApp(configuredApp);
}