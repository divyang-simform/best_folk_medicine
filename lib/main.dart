import 'dart:convert';

// import 'dart:html';

import 'package:best_folk_medicine/row.dart';
import 'package:best_folk_medicine/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          bodyText1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String data;
  late String data1;

  loadJson() async {
    data = await rootBundle.loadString('asset/data/category.json');
    data1 = await rootBundle.loadString('asset/data/article.json');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    var demo = jsonDecode(data);
    var article1 = jsonDecode(data1);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Best Folk Medicine",
          style: Theme.of(context).textTheme.headline1,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SearchBar(),
                Container(
                  height: 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: demo.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      margin:
                          const EdgeInsets.only(top: 20, right: 10, bottom: 20),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            demo[index]["name"],
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ),
                    // ListView.builder(scrollDirection: Axis.vertical,
                  ),
                ),
                RowPage(title: "Main Articles" ,  endtitle: "show more", link: true,),
                Container(
                    height: MediaQuery.of(context).size.height * .4,
                    // color: Colors.red,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: article1.length,
                        itemBuilder: (context, index) => SizedBox(
                              // height: MediaQuery.of(context).size.height*.4,
                              width: MediaQuery.of(context).size.width * .7,
                              child: Card(
                                child: Column(

                                  children: [
                                    Image.asset(
                                      article1[index]["image"],
                                      fit: BoxFit.cover,
                                      height: MediaQuery.of(context).size.height *
                                          .20,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RowPage(title: article1[index]["writter"], endtitle: article1[index]["postime"], link: false),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // Expanded(
                                    Text(
                                      article1[index]["title"],
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                      // )
                                    ),
                                  ],
                                ),
                              ),
                            ))),
                RowPage(title: "You have not finished reading",  endtitle: "show more", link: true,),
                Container(
                    height: MediaQuery.of(context).size.height * .2,
                    child: Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: article1.length,
                          itemBuilder: (context, index) => SizedBox(
                            // height: MediaQuery.of(context).size.height*.4,
                            width: MediaQuery.of(context).size.width * .7,
                            child: Card(
                              child: Row(
                                children: [
                                  Image.asset(
                                    article1[index]["image"],
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.height *
                                        .11,
                                    width: MediaQuery.of(context).size.width*.3,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            article1[index]["title"],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                            Theme.of(context).textTheme.bodyText1,
                                          ),
                                          Text(article1[index]["postime"]),
                                          Text(
                                            article1[index]["discription"],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Divider()
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
