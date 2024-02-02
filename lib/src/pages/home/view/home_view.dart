import 'package:fwc_album_app/src/models/user_model.dart';

abstract interface class HomeView {
   void updateUser(UserModel user);
   void error(String message);
   void showLoader();
   void logoutSuccess();
}