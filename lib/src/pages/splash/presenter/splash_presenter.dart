import 'package:fwc_album_app/src/core/mvp/presenter.dart';

abstract class SplashPresenter extends Presenter {
  Future<void> checkLogin();
}