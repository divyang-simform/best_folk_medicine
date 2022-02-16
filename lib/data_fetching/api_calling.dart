import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'convertor.dart';
import 'data.dart';
import 'package:chopper/chopper.dart';

part 'api_calling.chopper.dart';

@ChopperApi(
    baseUrl:
        "/v2/everything?q=apple&sortBy=popularity&apiKey=5377d5133c384339aa839c6bcdfe9d6f")
abstract class ApiService extends ChopperService {
  @Get()
  Future<Response<Postt>> getPost();

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://newsapi.org',
      services: [_$ApiService()],
      converter: ApiConvertor(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        const HeadersInterceptor({
          'Content-Type': 'Application/Json',
        }),
        RequestsInterceptor(),
        (Response response) async {
          if (response.statusCode != 200) {
            throw AllException();
          }
          return response;
        },
        MobileDataInterceptor(),
      ],
    );
    return _$ApiService(client);
  }
}

class AllException implements Exception {
  final message = "Error :( " ;

  @override
  String toString() => message;
}

class MobileDataInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result == false) {
      throw InternetException();
    }
    return request;
  }
}

class InternetException implements Exception {
  final message = 'No Internet';

  @override
  String toString() => message;
}

class RequestsInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    return applyHeader(request, 'authorization',
        'Bearer ${"5377d5133c384339aa839c6bcdfe9d6f"}',
        override: false);
  }
}
