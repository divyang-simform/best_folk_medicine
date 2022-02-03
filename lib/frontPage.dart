import 'dart:convert';

// import 'dart:html';
import 'package:best_folk_medicine/parsingdata.dart';

import 'card.dart';
import 'detail.dart';
import 'row.dart';
import 'search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? categary;
  String? article;
  AnimationController? loading;
  late var categaryDetail;
  late var article1;

  loadJson() async {
    categary = await rootBundle.loadString('asset/data/category.json');
    article = await rootBundle.loadString('asset/data/article.json');
    categaryDetail = await jsonDecode(categary!);
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
  void dispose() {
    loading?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SearchBar(),
              const SizedBox(height: 30),
              (categary == null)
                  ? CircularProgressIndicator(
                      value: loading?.value, strokeWidth: 4)
                  : Container(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categaryDetail.length,
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.only(
                              top: 20, right: 10, bottom: 20),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(categaryDetail[index]["name"],
                                  style: Theme.of(context).textTheme.bodyText1),
                            ),
                          ),
                        ),
                      ),
                    ),
              RowPage(
                  title: "Main Articles", endtitle: "show more", link: true),
              (article == null)
                  ? CircularProgressIndicator(
                      value: loading?.value, strokeWidth: 4)
                  : Container(
                      height: MediaQuery.of(context).size.height * .4,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: article1.length,
                        itemBuilder: (context, index) => SizedBox(
                          width: MediaQuery.of(context).size.width * .7,
                          child: GestureDetector(
                            child: Card(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Hero(
                                        tag: article1[index]["id"],
                                        child: Image.asset(
                                            article1[index]["image"],
                                            fit: BoxFit.fill,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .25,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .7)),
                                    const SizedBox(height: 10),
                                    RowPage(
                                        title: article1[index]["writer"],
                                        endtitle: article1[index]["pastime"],
                                        link: false),
                                    const SizedBox(height: 10),
                                    Text(article1[index]["title"],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1)
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, detailPage.detailPagedata,
                                  arguments: Product(
                                      id: article1[index]["id"],
                                      image: article1[index]["image"],
                                      name: article1[index]["writer"],
                                      description: article1[index]
                                          ["description"],
                                      title: article1[index]["title"],
                                      time: article1[index]["pastime"]));
                            },
                          ),
                        ),
                      ),
                    ),
              RowPage(
                  title: "You have not finished reading",
                  endtitle: "show more",
                  link: true),
              (article == null)
                  ? CircularProgressIndicator(
                      value: loading?.value, strokeWidth: 4)
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
                                context, detailPage.detailPagedata,
                                // arguments: Product(id: article1[index]["id"]),
                                arguments: Product(
                                    id: article1[index]["id"],
                                    image: article1[index]["image"],
                                    name: article1[index]["writer"],
                                    description: article1[index]["description"],
                                    title: article1[index]["title"],
                                    time: article1[index]["pastime"]));
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
