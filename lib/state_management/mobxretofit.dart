import '../data_fetching/api_calling_byretrofit.dart';
import '../data_fetching/data.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';

part 'mobxretofit.g.dart';

class DataFile = _DataFile with _$DataFile;

abstract class _DataFile with Store {
  ApiCalling apiCalling = ApiCalling(Dio(BaseOptions()));
  @observable
  Postt? getData;
  @observable
  ObservableFuture? response;

  @action
  onData() async {
    response = ObservableFuture(apiCalling.getPost());
    getData = await response;
    return getData;
  }
}
