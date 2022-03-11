// import '../DataBase/database.dart';
import '../DataBase/moor_database.dart';
// import '../data_fetching/Articles.dart';
import 'package:mobx/mobx.dart';

import '../data_fetching/Articles.dart';

part 'favoritemoor.g.dart';

class FavoritesMoor = _FavoritesMoor with _$FavoritesMoor;

abstract class _FavoritesMoor with Store {

  final database = FavoriteDataBase();
  // @observable
  // bool? check;
  //
  // @observable
  // Articles? id;
  //
  @observable
  List? data;
  @observable
  ObservableStream<List>? response;

  @action
  getAllData() async {
    data = await database.getAllTasks();
    // response = ObservableStream(database.watchAllTasks());
  }
  //
  // @action
  // getSingleData(int id) {
  //   response = ObservableFuture(ArticleFavorite.instance.singleArticle(id));
  // }
  //
  // // @action
  // // getCheckData(String title) async {
  // //   check = await ArticleFavorite.instance.checkArticle(title);
  // //   check == true ? getCheckIdData(title) : null;
  // // }
  // //
  // // getCheckIdData(String title) async {
  // //   id = await ArticleFavorite.instance.checkIdArticle(title);
  // // }
  //
  @action
  setData(FavoriteMoorData favoriteMoorData) async {
    database.insert(favoriteMoorData);
    getAllData();
  }
  @action
  getDeleteData(FavoriteMoorData favoriteMoorData) async {
    database.deletedata(favoriteMoorData);
    getAllData();
  }
}
