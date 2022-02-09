// import 'dart:js';

import 'alert.dart';
import 'dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bottomsheet.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({Key? key}) : super(key: key);

  @override
  _settingsPageState createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(25),
            child: MaterialButton(
              child: const Text(
                'Alert Button',
                style: TextStyle(fontSize: 20.0),
              ),
              // onPressed: () =>  alertPage(title: "title", content: "content")
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) =>
                        alertPage(title: "title", content: "content"));
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: MaterialButton(
              child:const Text(
                'Simple Buttom',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) =>
                        dialogPage(title: "delete", content: "helloo"));
              },
            ),
          ),
          // Scaffold.of(context).showBottomSheet<void>(
          //     (BuildContext context)
          //     },
          Container(
            margin: const EdgeInsets.all(25),
            child: MaterialButton(
              child:const Text(
                'Bottom Button',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) => bottomSheet(
                        title: "title",
                        message: "testing purpose",
                        button1: "thanks",
                        button2: "have a nice day"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
