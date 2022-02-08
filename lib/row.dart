import 'showallarticles.dart';
import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  RowPage(
      {Key? key,
      required this.title,
      required this.endtitle,
      required this.link})
      : super(key: key);

  String title;
  String endtitle;
  bool link;
//
//   @override
//   _RowPageState createState() => _RowPageState();
// }

// class _RowPageState extends State<RowPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const Expanded(child: Text("")),
        link == true
            ? TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, showAllArticales.showArticalesdata);
                },
                child: Text(endtitle))
            : Text(endtitle),
      ],
    );
  }
}
