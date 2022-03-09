import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import '../data_fetching/Articles.dart';

part 'hivemobx.g.dart';

class FavoriteHive = _FavoriteHive with _$FavoriteHive;

abstract class _FavoriteHive with Store {
  final dataBox = Hive.box("Favorite");
  // @observable
  // bool? check;
  //
  // @observable
  // Articles? id;
  //


  @observable
  List<Articles>? response;

  // @action
  // getAllData() async {
  //   response = ObservableFuture(dataBox.);
  //   data = await response;
  // }

  // @action
  // getSingleData(int id) {
  //   response = ObservableFuture();
  // }

  @action
  getCheckData() {
    response = Hive.box("Favorite").values.cast<Articles>().toList();
  }
  //
  // getCheckIdData(String title) async {
  //   id = await ArticleFavorite.instance.checkIdArticle(title);
  // }

  @action
  setData(Articles articles) {
    Hive.box("Favorite").add(articles);
    getCheckData();
  }

  @action
  getDeleteData(int id) {
    Hive.box("Favorite").deleteAt(id);
    getCheckData();
  }
}
