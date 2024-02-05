import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album_app/src/core/exceptions/repository_exception.dart';
import 'package:fwc_album_app/src/core/rest/custom_dio.dart';
import 'package:fwc_album_app/src/models/groups_stickers_model.dart';

import './stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  final CustomDio dio;

  StickersRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<GroupsStickersModel>> getMyAlbum() async {
    try {
      final result = await dio.auth().get("countries");

      return result.data.map((g) {
        return GroupsStickersModel.fromMap(g);
      }).toList();
    } on DioError catch (e, s) {
      log("Erro ao buscar album do usuário", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar album do usuário");
    }
  }
}
