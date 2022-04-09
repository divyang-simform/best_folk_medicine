import '../SharedPreferences/favoritesharedpreferences.dart';
import '../state_management/favoritemoor.dart';
import '../state_management/hivemobx.dart';
import '../Flavors/app_config.dart';
import '../Setting/resources.dart';
import '../homepagedata/search.dart';
import '../state_management/favoritemobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import '../homepagedata/card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _preferences = Preferences();
  String? url;

  void _fields() async {
    final settings = await _preferences.getSetting();
    setState(() {
      url = settings.urlToImage;
    });
  }

  @override
  void initState() {
    super.initState();
    _fields();
  }

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    final _favoriteHive = Provider.of<FavoriteHive>(context);
    final favorite = Provider.of<Favorite>(context);
    final _favoriteMoor = Provider.of<FavoritesMoor>(context);
    favorite.getAllData();
    _favoriteMoor.getAllData();
    switch (config?.appInternalId.toString()) {
      case "1":
        return Observer(builder: (_) {
          if (favorite.response?.status == FutureStatus.pending) {
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator.adaptive());
          } else if (favorite.response?.status == FutureStatus.rejected) {
            return const Text("Error :(");
          } else {
            return (favorite.data == null)
                ? Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator.adaptive())
                : (favorite.data?.isEmpty ?? true)
                    ? Image.network(
                        url ?? kEmptyCartImage,
                        errorBuilder: (_, __, ___) =>
                            Image.network(kUrlToImage),
                      )
                    : Column(
                        children: [
                          const SearchBar(),
                          const SizedBox(height: 20),
                          Container(
                            alignment: Alignment.topCenter,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: favorite.data?.length,
                              itemBuilder: (context, index) => Slidable(
                                startActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (BuildContext context) {
                                        favorite.getDeleteData(int.parse(
                                            favorite.data![index].id
                                                .toString()));
                                      },
                                      backgroundColor: kDeleteButtonBGColor,
                                      foregroundColor: kDeleteButtonTextColor,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
                                ),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (BuildContext context) {
                                        favorite.getDeleteData(int.parse(
                                            favorite.data![index].id
                                                .toString()));
                                      },
                                      backgroundColor: kDeleteButtonBGColor,
                                      foregroundColor: kDeleteButtonTextColor,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
                                ),
                                child: CardPage(
                                    articles: favorite.data![index], mode: 1),
                              ),
                            ),
                          ),
                        ],
                      );
          }
        });
      case "2":
        return Observer(builder: (_) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            _favoriteHive.getCheckData();
          });
          return (_favoriteHive.response?.isEmpty ?? true)
              ? Image.network(kEmptyCartImage)
              : Column(
                  children: [
                    const SearchBar(),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _favoriteHive.response?.length,
                        itemBuilder: (context, index) => Slidable(
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (BuildContext context) {
                                  _favoriteHive.getDeleteData(index);
                                },
                                backgroundColor: kDeleteButtonBGColor,
                                foregroundColor: kDeleteButtonTextColor,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (BuildContext context) {
                                  _favoriteHive.getDeleteData(index);
                                },
                                backgroundColor: kDeleteButtonBGColor,
                                foregroundColor: kDeleteButtonTextColor,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: CardPage(
                              articles: _favoriteHive.response![index],
                              mode: 1),
                        ),
                      ),
                    ),
                  ],
                );
        });
      case "3":
        return Observer(builder: (_) {
          return (_favoriteMoor.data?.isEmpty ?? true)
              ? Image.network(kEmptyCartImage)
              : Column(
                  children: [
                    const SearchBar(),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _favoriteMoor.data?.length,
                        itemBuilder: (context, index) => Slidable(
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (BuildContext context) {
                                  _favoriteMoor.getDeleteData(
                                      _favoriteMoor.data![index]);
                                },
                                backgroundColor: kDeleteButtonBGColor,
                                foregroundColor: kDeleteButtonTextColor,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (BuildContext context) {
                                  _favoriteMoor.getDeleteData(
                                      _favoriteMoor.data![index]);
                                },
                                backgroundColor: kDeleteButtonBGColor,
                                foregroundColor: kDeleteButtonTextColor,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: CardPage(
                            favoriteMoorData: _favoriteMoor.data![index],
                            mode: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        });
      default:
        {
          return Container();
        }
    }
  }
}
