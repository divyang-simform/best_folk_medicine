import 'dart:convert';

import 'controlbox.dart';
import 'detail.dart';
import 'parsingdata.dart';
import 'search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'card.dart';

class showAllArticales extends StatefulWidget {
  static const showArticalesdata = '/showarticalespage';

  const showAllArticales({Key? key}) : super(key: key);

  @override
  _showAllArticalesState createState() => _showAllArticalesState();
}

class _showAllArticalesState extends State<showAllArticales> {
  String? article;
  late var article1;

  loadJson() async {
    article = await rootBundle.loadString('asset/data/article.json');

    article1 = await jsonDecode(article!);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
          backgroundColor: kappBarBgcolor,
          title: Text("All Articales",
              style: Theme.of(context).textTheme.headline1),
          elevation: 0.0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SearchBar(),
              const SizedBox(height: 30),
              (article == null)
                  ? CircularProgressIndicator(strokeWidth: 4)
                  : Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: article1.length,
                        itemBuilder: (context, index) => GestureDetector(
                          child: cardPage(
                              image: article1[index]["image"],
                              title: article1[index]["title"],
                              description: article1[index]["description"],
                              time: article1[index]["pastime"]),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              detailPage.detailPagedata,
                              arguments: Product(
                                  id: article1[index]["id"],
                                  image: article1[index]["image"],
                                  name: article1[index]["writer"],
                                  description: article1[index]["description"],
                                  title: article1[index]["title"],
                                  time: article1[index]["pastime"]),
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
