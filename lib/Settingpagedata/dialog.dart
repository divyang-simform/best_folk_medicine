import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  DialogPage({Key? key, required this.title, required this.content})
      : super(key: key);
  String title;
  String content;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
      );
    } else {
      return SimpleDialog(
        title: Text(title),
        children: <Widget>[
          SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Done')),
          SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Done by today')),
        ],
      );
    }
  }
}
