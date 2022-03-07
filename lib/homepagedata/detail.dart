import 'package:provider/provider.dart';
import '../data_fetching/Articles.dart';
import '../Setting/resources.dart';
import 'row.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const detailPagedata = '/detailpage';

  DetailPage({Key? key, required this.articles}) : super(key: key);

  Articles articles;

  @override
  Widget build(BuildContext context) {
    final _favorite = Provider.of(context);
    List<String>? time1 = articles.publishedAt?.split('T');
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
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              _favorite.setData(articles);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Hero(
                  tag: articles.publishedAt as Object,
                  child: Image.network(articles.urlToImage.toString())),
              const SizedBox(height: 20),
              RowPage(
                  title: articles.author.toString(),
                  endtitle: time1![0],
                  link: false),
              const SizedBox(height: 20),
              Text(articles.title.toString(),
                  style: Theme.of(context).textTheme.headline1),
              const SizedBox(height: 20),
              Text(articles.description.toString(),
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
      ),
    );
  }
}
