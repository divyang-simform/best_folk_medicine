import 'alert.dart';
import 'dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Bottomsheet.dart';

class settingsPage extends StatelessWidget {
  const settingsPage({Key? key}) : super(key: key);

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
              child: const Text(
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
            margin: const EdgeInsets.all(25),
            child: MaterialButton(
              child: const Text(
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
