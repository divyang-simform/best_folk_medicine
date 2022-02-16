import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

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
        CurlInterceptor(),
        RequestsInterceptor(),
        MobileDataInterceptor(),
        (Response response) async {
          if (response.statusCode == 404) {
            throw FourOFourException();
          } else if (response.isSuccessful) {
            chopperLogger.info('200 done');
          } else {
            throw ErrorException();
          }
          return response;
        }
      ],
    );
    return _$ApiService(client);
  }
}

class FourOFourException implements Exception {
  final message = '404 Error';

  @override
  String toString() => message;
}

class ErrorException implements Exception {
  final message = 'Error';

  @override
  String toString() => message;
}

class MobileDataInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    final connectivityResult = await Connectivity().checkConnectivity();

    final isMobile = connectivityResult == ConnectivityResult.mobile;
    final isWifi = connectivityResult == ConnectivityResult.wifi;
    final isEthernet = connectivityResult == ConnectivityResult.ethernet;

    if (isMobile || isWifi || isEthernet) {
    } else {
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
