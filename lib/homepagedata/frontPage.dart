import 'dart:convert';
import 'retrofit_listbuilder.dart';
import '../Flavors/app_config.dart';
import 'chopper_listbuilder.dart';
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
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SearchBar(),
              const SizedBox(height: 30),
              (categary == null || categaryDetail == null)
                  ? const CircularProgressIndicator.adaptive(strokeWidth: 4)
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
              (config!.appInternalId == 1)
                  ? Container(
                      height: MediaQuery.of(context).size.height * .4,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: buildCard(context),
                    )
                  : (config.appInternalId == 2) ? Container(
                      height: MediaQuery.of(context).size.height * .4,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: buildAllArticles(context, 1) ,
                    ): Container(),
              Column(
                children: [
                  RowPage(
                      title: "You have not finished reading",
                      endtitle: "show more",
                      link: true),
                  (article == null)
                      ? const CircularProgressIndicator.adaptive()
                      : Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) => Column(
                              children: [
                                Card(
                                  elevation: 10,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Image.network(
                                            article1[index]["image"],
                                            fit: BoxFit.fill,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .11,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(article1[index]["title"],
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1),
                                              Text(article1[index]["pastime"]),
                                              Text(
                                                  article1[index]
                                                      ["description"],
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(thickness: 2)
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
