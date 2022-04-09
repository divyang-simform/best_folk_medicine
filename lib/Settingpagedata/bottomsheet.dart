import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheets extends StatelessWidget {
  BottomSheets(
      {Key? key,
      required this.title,
      required this.message,
      required this.button1,
      required this.button2})
      : super(key: key);
  String title;
  String message;
  String button1;
  String button2;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: CupertinoActionSheet(
          title: Text(title),
          message: Text(message),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: Text(button1),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: Text(button2),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    } else {
      return Container(
        height: 200,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(title),
              ElevatedButton(
                  child: Text(button1),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      );
    }
  }
}
