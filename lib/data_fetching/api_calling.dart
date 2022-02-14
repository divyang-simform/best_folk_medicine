import 'package:best_folk_medicine/data_fetching/convertor.dart';
import 'package:best_folk_medicine/data_fetching/data.dart';
import 'package:chopper/chopper.dart';

part 'api_calling.chopper.dart';

@ChopperApi(
    baseUrl: "/v2/everything?q=bitcoin&apiKey=5377d5133c384339aa839c6bcdfe9d6f")
abstract class ApiService extends ChopperService {
  @Get()
  Future<Response<Postt>> getPost();

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://newsapi.org',
      services: [
        _$ApiService(),
      ],
      converter: ApiConvertor(),
      errorConverter: JsonConverter(),
      // converter: JsonConverter(),


    );
    return _$ApiService(client);
  }
}
