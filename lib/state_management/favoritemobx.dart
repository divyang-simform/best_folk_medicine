import '../DataBase/database.dart';
import '../data_fetching/Articles.dart';
import 'package:mobx/mobx.dart';

part 'favoritemobx.g.dart';

class Favorite = _Favorite with _$Favorite;

abstract class _Favorite with Store {
  @observable
  bool? check;

  @observable
  Articles? id;

  @observable
  List<Articles>? data;

  @observable
  ObservableFuture? response;

  @action
  getAllData() async {
    response = ObservableFuture(ArticleFavorite.instance.allArticle());
    data = await response;
  }

  @action
  getSingleData(int id) {
    response = ObservableFuture(ArticleFavorite.instance.singleArticle(id));
  }

  @action
  getCheckData(String title) async {
    check = await ArticleFavorite.instance.checkArticle(title);
    check == true ? getCheckIdData(title) : null;
  }

  getCheckIdData(String title) async {
    id = await ArticleFavorite.instance.checkIdArticle(title);
  }

  @action
  setData(Articles articles) async {
    response = ObservableFuture(ArticleFavorite.instance.toInsert(articles));
    getAllData();
  }

  @action
  getDeleteData(int id) async {
    await ArticleFavorite.instance.deleteArticle(id);
    getAllData();
  }
}
