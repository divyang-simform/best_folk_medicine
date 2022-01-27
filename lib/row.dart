import 'package:flutter/material.dart';
class RowPage extends StatefulWidget {
   RowPage({Key? key, required this.title , required this.endtitle , required this.link}) : super(key: key);

  String title ;
  String endtitle ;
  bool link;

  @override
  _RowPageState createState() => _RowPageState();
}

class _RowPageState extends State<RowPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const Expanded(child: Text("")),
        widget.link == true ?  TextButton(onPressed: () {}, child: Text(widget.endtitle)) : Text(widget.endtitle),
      ],
    );
  }
}
