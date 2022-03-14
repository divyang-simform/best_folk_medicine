import '../DataBase/moor_database.dart';
import 'package:mobx/mobx.dart';
part 'favoritemoor.g.dart';

class FavoritesMoor = _FavoritesMoor with _$FavoritesMoor;

abstract class _FavoritesMoor with Store {

  final database = FavoriteDataBase();
  @observable
  bool? check;

  @observable
  List? data;
  @observable
  ObservableStream<List>? response;

  @action
  getAllData() async {
    data = await database.getAllTasks();
  }

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
