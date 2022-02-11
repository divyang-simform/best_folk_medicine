import 'package:chopper/chopper.dart';

part 'api_calling.chopper.dart';

@ChopperApi(
    baseUrl: "/v2/everything?q=bitcoin&apiKey=5377d5133c384339aa839c6bcdfe9d6f")
abstract class ApiService extends ChopperService {
  @Get()
  Future<Response> getPost();

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://newsapi.org',
      services: [
        _$ApiService(),
      ],
      converter: JsonConverter(),
    );
    return _$ApiService(client);
  }
}
