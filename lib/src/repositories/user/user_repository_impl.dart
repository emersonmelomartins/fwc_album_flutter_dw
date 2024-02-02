import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album_app/src/core/exceptions/repository_exception.dart';
import 'package:fwc_album_app/src/core/rest/custom_dio.dart';
import 'package:fwc_album_app/src/models/user_model.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final CustomDio dio;

  UserRepositoryImpl({required this.dio});

  @override
  Future<UserModel> getMe() async {
    try {
      final result = await dio.auth().get("/me");

      return UserModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log("Erro ao buscar dados do usuário logado.", error: e, stackTrace: s);
      throw RepositoryException(
          message: "Erro ao buscar dados do usuário logado.");
    }
  }
}
