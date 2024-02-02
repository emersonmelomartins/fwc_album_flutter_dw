import 'package:fwc_album_app/src/models/user_model.dart';

abstract interface class UserRepository {
  Future<UserModel> getMe();
}