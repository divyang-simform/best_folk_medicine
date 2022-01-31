// import 'dart:html';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bottomSheet extends StatelessWidget {
  bottomSheet(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('BottomSheet'),
              ElevatedButton(
                  child: const Text('Close BottomSheet'),
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
