import 'dart:developer';

import 'package:fwc_album_app/src/pages/home/presenter/home_presenter.dart';
import 'package:fwc_album_app/src/pages/home/view/home_view.dart';
import 'package:fwc_album_app/src/repositories/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePresenterImpl implements HomePresenter {
  UserRepository userRepository;
  late HomeView _view;

  HomePresenterImpl({
    required this.userRepository,
  });

  @override
  Future<void> getUserData() async {
    try {
      _view.showLoader();
      final user = await userRepository.getMe();
      _view.updateUser(user);
    } on Exception catch (e, s) {
      log("Erro ao buscar dados do usuário", error: e, stackTrace: s);
      _view.error("Erro ao buscar dados do usuário");
    }
  }

  @override
  Future<void> logout() async {
    _view.showLoader();
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    _view.logoutSuccess();
  }

  @override
  set view(HomeView view) {
    _view = view;
  }
}
