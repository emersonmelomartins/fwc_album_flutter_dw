import 'dart:developer';

import 'package:fwc_album_app/src/core/exceptions/unauthorized_exception.dart';
import 'package:fwc_album_app/src/pages/auth/login/presenter/login_presenter.dart';
import 'package:fwc_album_app/src/pages/auth/login/view/login_view.dart';
import 'package:fwc_album_app/src/services/login/login_service.dart';

class LoginPresenterImpl implements LoginPresenter {
  final LoginService loginService;
  late final LoginView _view;

  LoginPresenterImpl({
    required this.loginService,
  });

  @override
  Future<void> login(String email, String password) async {
    try {
      await loginService.execute(email: email, password: password);
      _view.success();
    } on UnauthorizedException {
      _view.error("Usuario ou senha inválidos.");
    } catch (e, s) {
      log("Erro ao realizar login", error: e, stackTrace: s);
      _view.error("Erro ao realizar login.");
    }
  }

  @override
  set view(LoginView view) {
    _view = view;
  }
}
