import '../Setting/resources.dart';
import '../data_fetching/articles.dart';
import '../data_fetching/parsingdata.dart';
import 'detail.dart';
import 'package:flutter/material.dart';

class MyCardPage extends StatelessWidget {
  MyCardPage({Key? key, required this.articles}) : super(key: key);

  Articles articles;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: GestureDetector(
        child: Card(
          elevation: 10,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: articles.publishedAt as Object,
                  child: Image.network(articles.urlToImage.toString(),
                      errorBuilder: (_, __, ___) => Image.network(kUrlToImage,
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * .24,
                          width: MediaQuery.of(context).size.width * .8),
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * .24,
                      width: MediaQuery.of(context).size.width * .8),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          (articles.author == "noreply@blogger.com (Unknown)")
                              ? const Text("")
                              : Expanded(
                                  child: Text(articles.author.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(articles.title.toString(),
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
          Navigator.pushNamed(context, DetailPage.detailPagedata,
              arguments: Product(articles: articles, mode: 1));
        },
      ),
    );
  }
}
