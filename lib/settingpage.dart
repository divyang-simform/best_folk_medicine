// import 'dart:js';

import 'package:best_folk_medicine/alert.dart';
import 'package:best_folk_medicine/controlbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({Key? key}) : super(key: key);

  @override
  _settingsPageState createState() => _settingsPageState();
}
cupertinoalertButtonfuntion (String title , String content) {
  CupertinoAlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      CupertinoDialogAction(
          child: Text("YES"),
          onPressed: () {}
      ),
      CupertinoDialogAction(
          child: Text("NO"),
          onPressed: (){}
      )
    ],
  );
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
                  onPressed: () => {
                        showDialog(
                          context: context,
                          builder: (ctx) => cupertinoalertButtonfuntion(
                            "Alert Dialog Box",
                            "You have raised a Alert Dialog Box"),
                          ),

                      }),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: MaterialButton(
                child: Text(
                  'Simple Buttom',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const alertButtonPage()),
                );},
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: MaterialButton(
                child: Text(
                  'Bottom Button',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
