import '../DataBase/database.dart';
import '../data_fetching/Articles.dart';
import 'package:mobx/mobx.dart';

part 'favoritemobx.g.dart';

class Favorite = _Favorite with _$Favorite;

abstract class _Favorite with Store {
  @observable
  ObservableFuture? response;

  @action
  Future<List<Articles>> getAllData() async {
    final response =
        await ObservableFuture(ArticleFavorite.instance.allArticle());
    return response;
  }

  @action
  Future<Articles> getSingleData(int id) async {
    final response = await ArticleFavorite.instance.singleArticle(id);
    return response;
  }

  @action
  Future<Articles> setData(Articles articles) async {
    final response =
        await ObservableFuture(ArticleFavorite.instance.toInsert(articles));
    return response;
  }

  @action
  Future<int> getDeleteData(int id) async {
    final response =
        await ObservableFuture(ArticleFavorite.instance.deleteArticle(id));
    return response;
  }
}
