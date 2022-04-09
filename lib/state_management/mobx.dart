import '../data_fetching/data.dart';
import 'package:chopper/chopper.dart';
import '../data_fetching/api_calling.dart';
import 'package:mobx/mobx.dart';

part 'mobx.g.dart';

class Data = _Data with _$Data;

abstract class _Data with Store {
  ApiService apiService = ApiService.create();
  @observable
  Response<Postt>? getData;
  @observable
  ObservableFuture? response;

  @action
  Future<Postt> onData() async {
    final response = await apiService.getPost();
    return response.body!;
  }
  @action
  onDatas() async {
    response = ObservableFuture(apiService.getPost());
    getData = await response;
    return getData;
  }
}
