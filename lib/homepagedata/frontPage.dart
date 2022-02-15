import 'dart:convert';
import '../setting/image_control_box.dart';
import '../data_fetching/api_calling.dart';
import '../data_fetching/data.dart';
import '../setting/textcontrolbox.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import '../Flavors/app_config.dart';
import '../data_fetching/parsingdata.dart';
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
              (categary == null)
                  ? const CircularProgressIndicator(strokeWidth: 4)
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
              Container(
                height: MediaQuery.of(context).size.height * .4,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: buildCard(context),
              ),
              (config!.appInternalId == 1)
                  ? const SizedBox()
                  : Column(
                      children: [
                        RowPage(
                            title: "You have not finished reading",
                            endtitle: "show more",
                            link: true),
                        (article == null)
                            ? const CircularProgressIndicator()
                            : Container(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 3,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    child: cardPage(
                                        image: article1[index]["image"],
                                        title: article1[index]["title"],
                                        description: article1[index]
                                            ["description"],
                                        time: article1[index]["pastime"]),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, detailPage.detailPagedata,
                                          arguments: Product(
                                              image: article1[index]["image"],
                                              name: article1[index]["writer"],
                                              description: article1[index]
                                                  ["description"],
                                              title: article1[index]["title"],
                                              time: article1[index]
                                                  ["pastime"]));
                                    },
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

  FutureBuilder<Response<Postt>> buildCard(BuildContext context) {
    return FutureBuilder<Response<Postt>>(
      future: Provider.of<ApiService>(context).getPost(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }
          final posts = snapshot.data?.body;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 5, //posts?.articles.length,
            itemBuilder: (context, index) => SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: GestureDetector(
                child: Card(
                  elevation: 10,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.network(
                            posts?.articles[index].urlToImage ?? kUrlToImage,
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height * .24,
                            width: MediaQuery.of(context).size.width * .8),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  (posts?.articles[index].author ==
                                          "noreply@blogger.com (Unknown)")
                                      ? const Text("")
                                      : Expanded(
                                          child: Text(
                                              posts?.articles[index].author ??
                                                  kAuthorName,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1),
                                        ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(posts?.articles[index].title ?? kTitle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline1)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, detailPage.detailPagedata,
                      arguments: Product(
                          image:
                              posts?.articles[index].urlToImage ?? kUrlToImage,
                          name: posts?.articles[index].author ?? kAuthorName,
                          description: posts?.articles[index].description ??
                              kDescription,
                          title: posts?.articles[index].title ?? kTitle,
                          time: posts?.articles[index].publishedAt ??
                              kPublishedAt));
                },
              ),
            ),
          );
        } else {
          return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator());
        }
      },
    );
  }
}