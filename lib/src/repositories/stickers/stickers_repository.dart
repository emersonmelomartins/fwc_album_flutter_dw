import 'package:fwc_album_app/src/models/groups_stickers_model.dart';

abstract interface class StickersRepository {
  Future<List<GroupsStickersModel>> getMyAlbum();
}