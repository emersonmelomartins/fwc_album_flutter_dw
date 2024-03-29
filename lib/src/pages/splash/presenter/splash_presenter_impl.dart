import 'package:fwc_album_app/src/pages/splash/presenter/splash_presenter.dart';
import 'package:fwc_album_app/src/pages/splash/view/splash_view.dart';


class SplashPresenterImpl implements SplashPresenter {
  late final SplashView _view;

  @override
  Future<void> checkLogin() async {
    _view.showLoader();
    await Future.delayed(const Duration(seconds: 2));
    _view.logged(false);
  }

  @override
  set view(view) {
    _view = view;
  }
  
}
