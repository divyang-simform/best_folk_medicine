import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class alertPage extends StatelessWidget {
  alertPage({Key? key, required this.title, required this.content })
      : super(key: key);
  String title;
  String content;
  @override
  Widget build(BuildContext context) {

    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          CupertinoDialogAction(child: Text("YES"), onPressed: () {}),
          CupertinoDialogAction(
              child: Text("NO"),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      );
    }
    else{
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      );
    }
  }
}
