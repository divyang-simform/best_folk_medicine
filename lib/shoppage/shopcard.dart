import 'package:flutter/material.dart';

class shopCardPage extends StatelessWidget {
  shopCardPage({Key? key, required this.image, required this.name})
      : super(key: key);
  String name;
  String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(image,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * .18),
          const SizedBox(height: 10),
          Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
