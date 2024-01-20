import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album_app/src/core/exceptions/repository_exception.dart';
import 'package:fwc_album_app/src/core/exceptions/unauthorized_exception.dart';
import 'package:fwc_album_app/src/core/rest/custom_dio.dart';
import 'package:fwc_album_app/src/models/register_user_model.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({required this.dio});

  @override
  Future<String> login(
      {required String email, required String password}) async {
    try {
      final result = await dio.post("/auth", data: {
        "email": email,
        "password": password,
      });

      final accessToken = result.data["access_token"];

      if (accessToken) {
        throw UnauthorizedException();
      }

      return accessToken;
    } on DioError catch (e, s) {
      log("Erro ao efetuar login", error: e, stackTrace: s);

      if (e.response?.statusCode == 401) {
        throw UnauthorizedException();
      }

      throw RepositoryException(message: "Erro ao efetuar login");
    }
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<void> register(RegisterUserModel registerModel) async {
    try {
      await dio.unAuth().post("/register", data: registerModel.toMap());
    } on DioError catch (e, s) {
      log("Erro ao registrar usuário", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao registrar usuário");
    }
  }
}
