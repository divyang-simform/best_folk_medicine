import 'package:flutter/material.dart';

class shopCardPage extends StatefulWidget {
  shopCardPage({Key? key, required this.image, required this.name})
      : super(key: key);
  String name;
  String image;

  @override
  _shopCardPageState createState() => _shopCardPageState();
}

class _shopCardPageState extends State<shopCardPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(widget.image,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * .18),
          const SizedBox(height: 10),
          Text(widget.name, maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
