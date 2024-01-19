import 'package:fwc_album_app/src/core/mvp/presenter.dart';
import 'package:fwc_album_app/src/pages/auth/register/view/register_view.dart';

abstract interface class RegisterPresenter extends Presenter<RegisterView> {
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });
}
