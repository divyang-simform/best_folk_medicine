import '../Setting/resources.dart';
import 'row.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const detailPagedata = '/detailpage';

  DetailPage({
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
  Widget build(BuildContext context) {
    List<String>? time1 = time.split('T');
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
              Hero(tag: time, child: Image.network(image)),
              const SizedBox(height: 20),
              RowPage(title: name, endtitle: time1[0], link: false),
              const SizedBox(height: 20),
              Text(title, style: Theme.of(context).textTheme.headline1),
              const SizedBox(height: 20),
              Text(description, style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
      ),
    );
  }
}
