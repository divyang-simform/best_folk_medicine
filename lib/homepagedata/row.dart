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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title, style: Theme.of(context).textTheme.bodyText1),
        ),
        const Spacer(),
        link == true
            ? Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ShowAllArticales.showArticalesdata);
                    },
                    child: Text(endtitle)),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(endtitle)),
      ],
    );
  }
}
