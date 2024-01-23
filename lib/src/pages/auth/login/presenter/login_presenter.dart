import 'package:fwc_album_app/src/core/mvp/presenter.dart';
import 'package:fwc_album_app/src/pages/auth/login/view/login_view.dart';

abstract class LoginPresenter extends Presenter<LoginView> {
  Future<void> login(String email, String password);
}
