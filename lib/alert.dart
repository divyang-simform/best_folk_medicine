import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class alertButtonPage extends StatefulWidget {
  const alertButtonPage({Key? key}) : super(key: key);

  @override
  _alertButtonPageState createState() => _alertButtonPageState();
}

class _alertButtonPageState extends State<alertButtonPage> {
  @override
  Widget build(BuildContext context) {
    String title = "Delete File";
    String content = "Are you sure you want to delete the file?";
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        CupertinoDialogAction(
            child: Text("YES"),
            onPressed: () {}
        ),
        CupertinoDialogAction(
            child: Text("NO"),
            onPressed: (){
              Navigator.of(context).pop();
            }
        )
      ],
    );
    ;
  }
}
