import 'package:flutter/material.dart';

class cardPage extends StatefulWidget {
  cardPage({
    Key? key,
    this.image,
    this.title,
    this.description,
    this.time,
  }) : super(key: key);
  String? image;
  String? title;
  String? time;
  String? description;

  @override
  _cardPageState createState() => _cardPageState();
}

class _cardPageState extends State<cardPage> {
  @override
  Widget build(BuildContext context) {
    List<String>? time1 = widget.time?.split('T');
    return Column(
      children: [
        Card(
          elevation: 10,
          child: Row(
            children: [
              Image.network(widget.image!,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * .11,
                  width: MediaQuery.of(context).size.width * .3),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1),
                      Text(time1![0]),
                      Text(widget.description!,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
