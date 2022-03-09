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

  DetailPage({Key? key, required this.articles}) : super(key: key);

  Articles articles;

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);
    final _favoriteHive = Provider.of<FavoriteHive>(context);
    final _favorite = Provider.of<Favorite>(context);
    _favorite.getCheckData(articles.title.toString());
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
            Observer(builder: (context) {
              return config?.appInternalId == 1
                  ? (_favorite.check ?? false)
                      ? IconButton(
                          icon: const Icon(Icons.favorite, color: Colors.red),
                          onPressed: () {
                            _favorite.getDeleteData(
                                int.parse(_favorite.id?.id.toString() ?? "1"));
                            _favorite.getCheckData(articles.title.toString());
                          },
                        )
                      : IconButton(
                          icon: const Icon(Icons.favorite_border,
                              color: Colors.black),
                          onPressed: () {
                            _favorite.setData(articles);
                            _favorite.getCheckData(articles.title.toString());
                          },
                        )
                  :
                  // (_favorite.check ?? false)
                  //         ? IconButton(
                  //             icon: const Icon(Icons.favorite, color: Colors.red),
                  //             onPressed: () {},
                  //           )
                  //         :
                  IconButton(
                      icon: const Icon(Icons.favorite_border,
                          color: Colors.black),
                      onPressed: () {
                        _favoriteHive.setData(articles);
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
