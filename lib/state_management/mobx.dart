import 'package:best_folk_medicine/data_fetching/data.dart';
import 'package:chopper/chopper.dart';

import '../data_fetching/api_calling.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'mobx.g.dart';

class Data = _Data with _$Data;

abstract class _Data with Store {
  ApiService apiService = ApiService.create();
  @observable
  Response<Postt>? getData;
  @observable
  ObservableFuture? response;

  // @action
  // Future<Postt> onData() async {
  //   final response = await apiService.getPost();
  //   // getData = response.body!;
  //   return response.body!;
  // }
  @action
  onData() async {
    response = ObservableFuture(apiService.getPost());
    getData = await response;
    return getData;
  }
}
