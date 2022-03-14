import '../DataBase/moor_database.dart';
import '../SharedPreferences/favoritesharedpreferences.dart';
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

class DetailPage extends StatefulWidget {
  static const detailPagedata = '/detailpage';

  DetailPage(
      {Key? key, this.articles, required this.mode, this.favoriteMoorData})
      : super(key: key);

  Articles? articles;
  FavoriteMoorData? favoriteMoorData;
  int mode;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _preferences = Preferences();

  @override
  Widget build(BuildContext context) {
    switch (widget.mode) {
      case 1:
        final config = AppConfig.of(context);
        final _favoriteHive = Provider.of<FavoriteHive>(context);
        final _favorite = Provider.of<Favorite>(context);
        final _moor = Provider.of<FavoritesMoor>(context);
        _moor.getAllData();
        var k = _moor.data?.length as num;
        for (var i = 0; i < k; i++) {
          if (widget.articles?.title == _moor.data?[i].title) {
            _moor.check = true;
          }
        }
        _favorite.getCheckData((widget.articles?.title).toString());
        List<String>? time1 = widget.articles?.publishedAt?.split('T');
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
                      return Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                _preferences.cleanArtical();
                              },
                              icon: const Icon(Icons.delete,
                                  color: Colors.redAccent)),
                          IconButton(
                              onPressed: () {
                                saveSetting();
                              },
                              icon:
                                  const Icon(Icons.share, color: Colors.black)),
                          (_favorite.check ?? false)
                              ? IconButton(
                                  icon: const Icon(Icons.favorite,
                                      color: Colors.red),
                                  onPressed: () {
                                    _favorite.getDeleteData(int.parse(
                                        _favorite.id?.id.toString() ?? "1"));
                                    _favorite.getCheckData(
                                        (widget.articles?.title).toString());
                                  },
                                )
                              : IconButton(
                                  icon: const Icon(Icons.favorite_border,
                                      color: Colors.black),
                                  onPressed: () {
                                    _favorite.setData(widget.articles!);
                                    _favorite.getCheckData(
                                        (widget.articles?.title).toString());
                                  },
                                ),
                        ],
                      );
                    case 2:
                      return IconButton(
                        icon: const Icon(Icons.favorite_border,
                            color: Colors.black),
                        onPressed: () {
                          _favoriteHive.setData(widget.articles!);
                        },
                      );
                    case 3:
                      return (_moor.check ?? false)
                          ? IconButton(
                              icon:
                                  const Icon(Icons.favorite, color: Colors.red),
                              onPressed: () {
                                final _favoritemoordata = FavoriteMoorData(
                                    title: (widget.articles?.title).toString(),
                                    urlToImage: (widget.articles?.urlToImage)
                                        .toString(),
                                    url: (widget.articles?.url).toString(),
                                    publishedAt: (widget.articles?.publishedAt)
                                        .toString(),
                                    description: (widget.articles?.description)
                                        .toString(),
                                    author:
                                        (widget.articles?.author).toString(),
                                    content:
                                        (widget.articles?.content).toString());
                                _moor.getDeleteData(_favoritemoordata);
                                _moor.check = false;
                              },
                            )
                          : IconButton(
                              icon: const Icon(Icons.favorite_border,
                                  color: Colors.black),
                              onPressed: () {
                                final _favoritemoordata = FavoriteMoorData(
                                    title: (widget.articles?.title).toString(),
                                    urlToImage: (widget.articles?.urlToImage)
                                        .toString(),
                                    url: (widget.articles?.url).toString(),
                                    publishedAt: (widget.articles?.publishedAt)
                                        .toString(),
                                    description: (widget.articles?.description)
                                        .toString(),
                                    author:
                                        (widget.articles?.author).toString(),
                                    content:
                                        (widget.articles?.content).toString());

                                _moor.setData(_favoritemoordata);

                                _moor.check = true;
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
                      tag: widget.articles?.publishedAt as Object,
                      child: Image.network(
                          (widget.articles?.urlToImage).toString())),
                  const SizedBox(height: 20),
                  RowPage(
                      title: (widget.articles?.author).toString(),
                      endtitle: time1![0],
                      link: false),
                  const SizedBox(height: 20),
                  Text((widget.articles?.title).toString(),
                      style: Theme.of(context).textTheme.headline1),
                  const SizedBox(height: 20),
                  Text((widget.articles?.description).toString(),
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          ),
        );
      case 2:
        final _moor = Provider.of<FavoritesMoor>(context);
        List<String>? time1 = widget.favoriteMoorData?.publishedAt.split('T');
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
                          title: (widget.favoriteMoorData?.title).toString(),
                          urlToImage:
                              (widget.favoriteMoorData?.urlToImage).toString(),
                          url: (widget.favoriteMoorData?.url).toString(),
                          publishedAt:
                              (widget.favoriteMoorData?.publishedAt).toString(),
                          description:
                              (widget.favoriteMoorData?.description).toString(),
                          author: (widget.favoriteMoorData?.author).toString(),
                          content:
                              (widget.favoriteMoorData?.content).toString());
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
                      tag: widget.favoriteMoorData?.publishedAt as Object,
                      child: Image.network(
                          (widget.favoriteMoorData?.urlToImage).toString())),
                  const SizedBox(height: 20),
                  RowPage(
                      title: (widget.favoriteMoorData?.author).toString(),
                      endtitle: time1![0],
                      link: false),
                  const SizedBox(height: 20),
                  Text((widget.favoriteMoorData?.title).toString(),
                      style: Theme.of(context).textTheme.headline1),
                  const SizedBox(height: 20),
                  Text((widget.favoriteMoorData?.description).toString(),
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

  void saveSetting() async {
    final setting = Articles(urlToImage: widget.articles?.urlToImage);
    _preferences.saveArticlesSetting(setting);
  }
}
