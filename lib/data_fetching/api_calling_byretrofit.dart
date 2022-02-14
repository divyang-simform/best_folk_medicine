import 'package:best_folk_medicine/data_fetching/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


part 'api_calling_byretrofit.g.dart';

@RestApi(baseUrl: 'https://newsapi.org')
abstract class ApiCalling {
  factory ApiCalling (Dio dio) = _ApiCalling;

  @GET('/v2/everything?q=bitcoin&apiKey=5377d5133c384339aa839c6bcdfe9d6f')
  Future<Postt> getPost();
}
