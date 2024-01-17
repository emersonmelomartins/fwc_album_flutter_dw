import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:fwc_album_app/src/core/config/env/env.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.instance["API_BASE_URL"] ?? "",
          connectTimeout: 5000,
          receiveTimeout: 60000,
        )) {
    interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  CustomDio auth() {
    return this;
  }

  CustomDio unAuth() {
    return this;
  }
}
