import 'package:best_folk_medicine/data_fetching/api_calling.dart';
import 'package:provider/provider.dart';

import '../data_fetching/parsingdata.dart';
import 'detail.dart';
import 'package:flutter/material.dart';

class MyCardPage extends StatelessWidget {
  MyCardPage(
      {Key? key,
      required this.urlToImage,
      required this.title,
      required this.description,
      required this.author,
      required this.publishedAt})
      : super(key: key);
  String urlToImage;
  String author;
  String title;
  String description;
  String publishedAt;

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
                  tag: publishedAt,
                  child: Image.network(urlToImage,
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
                          (author == "noreply@blogger.com (Unknown)")
                              ? const Text("")
                              : Expanded(
                                  child: Text(author,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(title,
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
                  image: urlToImage,
                  name: author,
                  description: description,
                  title: title,
                  time: publishedAt));
        },
      ),
    );
  }
}
