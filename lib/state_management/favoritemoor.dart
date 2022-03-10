import '../DataBase/database.dart';
import '../DataBase/moor_database.dart';
import '../data_fetching/Articles.dart';
import 'package:mobx/mobx.dart';

part 'favoritemobx.g.dart';

class FavoriteMoor = _FavoriteMoor with _$FavoriteMoor;

abstract class _FavoriteMoor with Store {

  final database = FavoriteDataBase()
  // @observable
  // bool? check;
  //
  // @observable
  // Articles? id;

  @observable
  List<FavoriteMoorData>? data;

  @observable
  ObservableStream<List<FavoriteMoorData>>? response;

  @action
  getAllData() async {

    response = ObservableStream( database.watchAllTasks());
    // data = await response;
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
  // @action
  // setData(Articles articles) async {
  //   response = ObservableFuture(ArticleFavorite.instance.toInsert(articles));
  //   getAllData();
  // }
  //
  // @action
  // getDeleteData(int id) async {
  //   await ArticleFavorite.instance.deleteArticle(id);
  //   getAllData();
  // }
}
