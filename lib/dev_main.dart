import 'package:flutter/material.dart';

import 'app_config.dart';
import 'main.dart';

void main() {
  var configuredApp = AppConfig(
    appDisplayName: "Dev",
    appInternalId: 2,
    color: Colors.red,
    child: MyApp(),
  );

  mainCommon();

  runApp(configuredApp);
}
