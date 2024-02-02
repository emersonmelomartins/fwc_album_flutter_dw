import 'package:flutter/widgets.dart';
import 'package:fwc_album_app/src/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/src/core/ui/helpers/messages.dart';
import 'package:fwc_album_app/src/models/user_model.dart';
import 'package:fwc_album_app/src/pages/home/home_page.dart';

import './home_view.dart';

abstract class HomeViewImpl extends State<HomePage>
    with Loader<HomePage>, Messages<HomePage>
    implements HomeView {
  UserModel? user;

  @override
  void initState() {
    widget.presenter.view = this;

    // Após carregar faz alguma coisa
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await widget.presenter.getUserData();
    });
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void logoutSuccess() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil("/auth/login", (route) => false);
  }

  @override
  void updateUser(UserModel user) {
    hideLoader();
    setState(() {
      this.user = user;
    });
  }
}
