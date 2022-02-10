import 'package:flutter/material.dart';

class cardPage extends StatefulWidget {
  cardPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.time,
  }) : super(key: key);
  String image;
  String title;
  String time;
  String description;

  @override
  _cardPageState createState() => _cardPageState();
}

class _cardPageState extends State<cardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Row(
            children: [
              Image.asset(widget.image,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * .11,
                  width: MediaQuery.of(context).size.width * .3),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1),
                      Text(widget.time),
                      Text(widget.description, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 2)
      ],
    );
  }
}
