import '../setting/textcontrolbox.dart';
import '../setting/controlbox.dart';
import 'row.dart';
import 'package:flutter/material.dart';

class detailPage extends StatefulWidget {
  static const detailPagedata = '/detailpage';

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
    List<String>? time1 = widget.time.split('T');
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(kDetailPageAppTitle,
            style: Theme.of(context).textTheme.headline1),
        backgroundColor: kappBarBgcolor,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
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
              Image.network(widget.image),
              SizedBox(height: 20),
              RowPage(title: widget.name, endtitle: time1[0], link: false),
              SizedBox(height: 20),
              Text(widget.title, style: Theme.of(context).textTheme.headline1),
              SizedBox(height: 20),
              Text(widget.description,
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
      ),
    );
  }
}
