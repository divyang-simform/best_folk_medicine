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

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    final _favoriteHive = Provider.of<FavoriteHive>(context);
    final favorite = Provider.of<Favorite>(context);
    favorite.getAllData();
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
                                child:
                                    CardPage(articles: favorite.data![index]),
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
                              articles: _favoriteHive.response![index]),
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
