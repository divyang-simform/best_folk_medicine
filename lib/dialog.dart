// import 'dart:html';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dialogPage extends StatelessWidget {
  dialogPage({Key? key, required this.title, required this.content})
      : super(key: key);
  String title;
  String content;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoDialogAction(
        child: Text(title),
        onPressed: () {
          Navigator.of(context).pop();
        },
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
