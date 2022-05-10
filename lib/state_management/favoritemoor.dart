import '../DataBase/moor_database.dart';
import 'package:mobx/mobx.dart';
part 'favoritemoor.g.dart';

class FavoritesMoor = _FavoritesMoor with _$FavoritesMoor;

abstract class _FavoritesMoor with Store {

  final database = FavoriteDataBase();
  @observable
  bool check = false;

  @observable
  List? data;
  @observable
  ObservableStream<List>? response;

  @action
  getAllData() async {
    data = await database.getAllTasks();
  }

  checkData(String title) async{
    getAllData();
    for (int i =0 ;i< ((data?.length ?? 1 )); i++){
      if( title == data![i].title){
        return check = true;
      }
    }
  }

  @action
  setData(FavoriteMoorData favoriteMoorData) async {
    database.insert(favoriteMoorData);
    getAllData();
    checkData(favoriteMoorData.title);
  }
  @action
  getDeleteData(FavoriteMoorData favoriteMoorData) async {
    database.deleteData(favoriteMoorData);
    getAllData();
    check = false;
  }
}
