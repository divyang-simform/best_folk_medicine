import 'data.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


part 'api_calling_byretrofit.g.dart';

@RestApi(baseUrl: 'https://newsapi.org')
abstract class ApiCalling {
  factory ApiCalling (Dio dio) = _ApiCalling;

  @GET('/v2/everything?q=mercedes&sortBy=popularity&apiKey=5377d5133c384339aa839c6bcdfe9d6f')
  Future<Postt> getPost();
}
