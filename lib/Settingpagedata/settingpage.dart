import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'bottomsheet.dart';
import 'alert.dart';
import 'dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool switchLocationBool = false;
  bool switchCameraBool = false;
  bool switchStorageBool = false;
  PermissionStatus? locationPermission;
  PermissionStatus? cameraPermission;
  PermissionStatus? storagePermission;

  void checkCondition() async {
    cameraPermission = await Permission.camera.status;
    locationPermission = await Permission.location.status;
    storagePermission = await Permission.storage.status;
    switchLocationBool =
        (locationPermission == PermissionStatus.granted) ? true : false;
    switchCameraBool =
        (cameraPermission == PermissionStatus.granted) ? true : false;
    switchStorageBool =
        (storagePermission == PermissionStatus.granted) ? true : false;
    setState(() {});
  }

  void getPermission(String type) async {
    switch (type) {
      case "location":
        if (locationPermission == PermissionStatus.permanentlyDenied) {
          AppSettings.openLocationSettings();
        }
        locationPermission = await Permission.location.request();
        if (locationPermission == PermissionStatus.granted) {
          switchLocationBool = true;
          setState(() {});
        }
        break;
      case "camera":
        if (cameraPermission == PermissionStatus.permanentlyDenied) {
          AppSettings.openAppSettings();
        }
        cameraPermission = await Permission.camera.request();
        if (cameraPermission == PermissionStatus.granted) {
          switchCameraBool = true;
          setState(() {});
        }
        break;
      case "storage":
        if (storagePermission == PermissionStatus.permanentlyDenied) {
          AppSettings.openAppSettings();
        }
        storagePermission = await Permission.storage.request();
        if (storagePermission == PermissionStatus.granted) {
          switchStorageBool = true;
          setState(() {});
        }
        break;
      default:
        {
          switchLocationBool = false;
          switchCameraBool = false;
          switchStorageBool = false;
        }
    }
  }

  @override
  void initState() {
    super.initState();
    checkCondition();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(25),
            child: MaterialButton(
              child:
                  const Text('Alert Button', style: TextStyle(fontSize: 20.0)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) =>
                        AlertPage(title: "title", content: "content"));
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: MaterialButton(
              child:
                  const Text('Simple Buttom', style: TextStyle(fontSize: 20.0)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) =>
                        DialogPage(title: "delete", content: "helloo"));
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: MaterialButton(
              child:
                  const Text('Bottom Button', style: TextStyle(fontSize: 20.0)),
              onPressed: () {
                showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) => BottomSheets(
                        title: "title",
                        message: "testing purpose",
                        button1: "thanks",
                        button2: "have a nice day"));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Location Permission :",
                  style: TextStyle(fontSize: 20.0)),
              const SizedBox(width: 20),
              Switch.adaptive(
                  value: switchLocationBool,
                  onChanged: (switchBool) {
                    getPermission("location");
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Camera Permission :",
                  style: TextStyle(fontSize: 20.0)),
              const SizedBox(width: 20),
              Switch.adaptive(
                  value: switchCameraBool,
                  onChanged: (switchBool) {
                    getPermission("camera");
                  }),
            ],
          ),
          (Platform.isAndroid)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Storage Permission :",
                        style: TextStyle(fontSize: 20.0)),
                    const SizedBox(width: 20),
                    Switch.adaptive(
                        value: switchStorageBool,
                        onChanged: (switchBool) {
                          getPermission("storage");
                        }),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
