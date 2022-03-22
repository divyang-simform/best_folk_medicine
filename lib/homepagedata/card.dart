import '../DataBase/moor_database.dart';
import '../Setting/resources.dart';
import '../data_fetching/articles.dart';
import '../data_fetching/parsingdata.dart';
import 'detail.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  CardPage({Key? key, this.articles, this.favoriteMoorData, required this.mode})
      : super(key: key);

  Articles? articles;
  FavoriteMoorData? favoriteMoorData;
  int mode;

  @override
  Widget build(BuildContext context) {
    switch (mode) {
      case 1:
        List<String>? time1 = articles?.publishedAt?.split('T');
        return Column(
          children: [
            GestureDetector(
              child: Card(
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: FadeInImage.assetNetwork(
                          placeholder: "asset/photo/No_Image.jpeg",
                          fadeInDuration: const Duration(seconds: 2),
                          image: (articles?.urlToImage).toString(),
                          imageErrorBuilder: (_, __, ___) {
                            return Image.asset("asset/photo/No_Image.jpeg",
                                height: MediaQuery.of(context).size.height * .11,
                                width: MediaQuery.of(context).size.width * .3);
                          },
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * .11,
                          width: MediaQuery.of(context).size.width * .3),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text((articles?.title).toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyText1),
                            Text(time1![0]),
                            Text((articles?.description).toString(),
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
                    articles: articles!,
                    favoriteMoorData: favoriteMoorData,
                    mode: mode,
                  ),
                );
              },
            ),
            const Divider(thickness: 2)
          ],
        );
      case 2:
        List<String>? time1 = favoriteMoorData?.publishedAt.split('T');
        return Column(
          children: [
            GestureDetector(
              child: Card(
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.network(
                          (favoriteMoorData?.urlToImage).toString(),
                          errorBuilder: (_, __, ___) => Image.network(
                              kUrlToImage,
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.height * .11,
                              width: MediaQuery.of(context).size.width * .3),
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * .11,
                          width: MediaQuery.of(context).size.width * .3),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text((favoriteMoorData?.title).toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyText1),
                            Text(time1![0]),
                            Text((favoriteMoorData?.description).toString(),
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
                  arguments:
                      Product(favoriteMoorData: favoriteMoorData, mode: 2),
                );
              },
            ),
            const Divider(thickness: 2)
          ],
        );
      default:
        {
          return Container();
        }
    }
  }
}
