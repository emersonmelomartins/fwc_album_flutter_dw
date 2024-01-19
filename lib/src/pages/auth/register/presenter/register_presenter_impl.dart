import 'dart:developer';

import 'package:fwc_album_app/src/models/register_user_model.dart';
import 'package:fwc_album_app/src/pages/auth/register/view/register_view.dart';
import 'package:fwc_album_app/src/repositories/auth/auth_repository.dart';

import './register_presenter.dart';

class RegisterPresenterImpl implements RegisterPresenter {
  late final AuthRepository authRepository;
  late final RegisterView _view;

  RegisterPresenterImpl({
    required this.authRepository,
  });

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final registerUserModel = RegisterUserModel(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      await authRepository.register(registerUserModel);

      _view.registerSuccess();
    } on Exception catch (e, s) {
      log("Erro ao registrar usuário", error: e, stackTrace: s);
      _view.registerError();
    }
  }

  @override
  set view(RegisterView view) {
    _view = view;
  }
}
