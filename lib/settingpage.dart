// import 'dart:js';

import 'package:best_folk_medicine/alert.dart';
import 'package:best_folk_medicine/controlbox.dart';
import 'package:best_folk_medicine/demo.dart';
import 'package:best_folk_medicine/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bottomsheet.dart';
import 'bottomnavigationbar.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({Key? key}) : super(key: key);

  @override
  _settingsPageState createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kbgcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(25),
              child: MaterialButton(
                child: Text(
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
              margin: EdgeInsets.all(25),
              child: MaterialButton(
                child: Text(
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
            Container(
              margin: EdgeInsets.all(25),
              child: MaterialButton(
                // bottomSheet
                child: Text(
                  'Bottom Button',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => bottomSheet(title: "title", message: "testing purpose", button1: "thanks", button2: "have a nice day")  );
                },
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: bottomBar(),
    );
  }
}
