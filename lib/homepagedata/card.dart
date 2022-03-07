import '../data_fetching/Articles.dart';
import '../data_fetching/parsingdata.dart';
import 'detail.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  CardPage({Key? key, required this.articles}) : super(key: key);

  Articles articles;

  @override
  Widget build(BuildContext context) {
    List<String>? time1 = articles.publishedAt?.split('T');
    return Column(
      children: [
        GestureDetector(
          child: Card(
            elevation: 10,
            child: Row(
              children: [
                Image.network(articles.urlToImage.toString(),
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height * .11,
                    width: MediaQuery.of(context).size.width * .3),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(articles.title.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1),
                        Text(time1![0]),
                        Text(articles.description.toString(),
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              DetailPage.detailPagedata,
              arguments: Product(
                articles: articles,
              ),
            );
          },
        ),
        const Divider(thickness: 2)
      ],
    );
  }
}
