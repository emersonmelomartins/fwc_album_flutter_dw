
import 'package:fwc_album_app/src/core/mvp/presenter.dart';
import 'package:fwc_album_app/src/pages/home/view/home_view.dart';

abstract class HomePresenter extends Presenter<HomeView> {
  Future<void> getUserData();
  Future<void> logout();
}