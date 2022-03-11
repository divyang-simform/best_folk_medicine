import '../DataBase/moor_database.dart';
import '../state_management/favoritemoor.dart';
import '../state_management/hivemobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../Flavors/app_config.dart';
import '../state_management/favoritemobx.dart';
import 'package:provider/provider.dart';
import '../data_fetching/Articles.dart';
import '../Setting/resources.dart';
import 'row.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const detailPagedata = '/detailpage';

  DetailPage(
      {Key? key, this.articles, required this.mode, this.favoriteMoorData})
      : super(key: key);

  Articles? articles;
  FavoriteMoorData? favoriteMoorData;
  int mode;

  @override
  Widget build(BuildContext context) {
    switch (mode) {
      case 1:
        final config = AppConfig.of(context);
        final _favoriteHive = Provider.of<FavoriteHive>(context);
        final _favorite = Provider.of<Favorite>(context);
        final _moor = Provider.of<FavoritesMoor>(context);
        _favorite.getCheckData((articles?.title).toString());
        List<String>? time1 = articles?.publishedAt?.split('T');
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
                Observer(builder: (context) {
                  switch (config?.appInternalId) {
                    case 1:
                      return (_favorite.check ?? false)
                          ? IconButton(
                              icon:
                                  const Icon(Icons.favorite, color: Colors.red),
                              onPressed: () {
                                _favorite.getDeleteData(int.parse(
                                    _favorite.id?.id.toString() ?? "1"));
                                _favorite
                                    .getCheckData((articles?.title).toString());
                              },
                            )
                          : IconButton(
                              icon: const Icon(Icons.favorite_border,
                                  color: Colors.black),
                              onPressed: () {
                                _favorite.setData(articles!);
                                _favorite
                                    .getCheckData((articles?.title).toString());
                              },
                            );
                    case 2:
                      return IconButton(
                        icon: const Icon(Icons.favorite_border,
                            color: Colors.black),
                        onPressed: () {
                          _favoriteHive.setData(articles!);
                        },
                      );
                    case 3:
                      return IconButton(
                        icon:
                        const Icon(Icons.favorite_border, color: Colors.black),
                        onPressed: () {
                          final _favoritemoordata = FavoriteMoorData(
                            title: (articles?.title).toString(),
                            urlToImage: (articles?.urlToImage).toString(),
                            url: (articles?.url).toString(),
                            publishedAt: (articles?.publishedAt).toString(),
                            description: (articles?.description).toString(),
                            author: (articles?.author).toString(),
                            content: (articles?.content).toString(),
                          );
                          _moor.setData(_favoritemoordata);
                        },
                      );
                    default:
                      {
                        return Container();
                      }
                  }
                }),
              ]),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Hero(
                      tag: articles?.publishedAt as Object,
                      child: Image.network((articles?.urlToImage).toString())),
                  const SizedBox(height: 20),
                  RowPage(
                      title: (articles?.author).toString(),
                      endtitle: time1![0],
                      link: false),
                  const SizedBox(height: 20),
                  Text((articles?.title).toString(),
                      style: Theme.of(context).textTheme.headline1),
                  const SizedBox(height: 20),
                  Text((articles?.description).toString(),
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          ),
        );
      case 2:
        final _moor = Provider.of<FavoritesMoor>(context);
        List<String>? time1 = favoriteMoorData?.publishedAt.split('T');
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
                Observer(builder: (context) {
                  return IconButton(
                    icon:
                        const Icon(Icons.favorite_border, color: Colors.black),
                    onPressed: () {
                      final _favoritemoordata = FavoriteMoorData(
                        title: (favoriteMoorData?.title).toString(),
                        urlToImage: (favoriteMoorData?.urlToImage).toString(),
                        url: (favoriteMoorData?.url).toString(),
                        publishedAt: (favoriteMoorData?.publishedAt).toString(),
                        description: (favoriteMoorData?.description).toString(),
                        author: (favoriteMoorData?.author).toString(),
                        content: (favoriteMoorData?.content).toString(),
                      );
                      _moor.setData(_favoritemoordata);
                    },
                  );
                }),
              ]),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Hero(
                      tag: favoriteMoorData?.publishedAt as Object,
                      child: Image.network(
                          (favoriteMoorData?.urlToImage).toString())),
                  const SizedBox(height: 20),
                  RowPage(
                      title: (favoriteMoorData?.author).toString(),
                      endtitle: time1![0],
                      link: false),
                  const SizedBox(height: 20),
                  Text((favoriteMoorData?.title).toString(),
                      style: Theme.of(context).textTheme.headline1),
                  const SizedBox(height: 20),
                  Text((favoriteMoorData?.description).toString(),
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          ),
        );
      default:
        {
          return Container();
        }
    }
  }
}
