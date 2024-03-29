import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:fwc_album_app/src/core/config/env/env.dart';
import 'package:fwc_album_app/src/core/rest/interceptors/auth_interceptor.dart';

class CustomDio extends DioForNative {
  final _authInterceptor = AuthInterceptor();

  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.instance["API_BASE_URL"] ?? "",
          connectTimeout: 5000,
          receiveTimeout: 60000,
        )) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }

  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unAuth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
