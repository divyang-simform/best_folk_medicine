import 'controlbox.dart';
import 'row.dart';
import 'package:flutter/material.dart';

class detailPage extends StatefulWidget {
  detailPage({
    Key? key,
    required this.image,
    required this.title,
    required this.name,
    required this.description,
    required this.time,
  }) : super(key: key);
  String image;
  String title;
  String time;
  String description;
  String name;

  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        title: Text("Articale" , style: Theme.of(context).textTheme.headline1,),
        backgroundColor: kappBarBgcolor,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(widget.image),
              RowPage(
                  title: widget.name,
                  endtitle: widget.time,
                  link: false),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(widget.description)
            ],
          ),
        ),
      ),
    );
  }
}
