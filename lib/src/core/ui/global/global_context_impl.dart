import 'package:flutter/material.dart';
import 'package:fwc_album_app/src/core/ui/global/global_context.dart';
import 'package:fwc_album_app/src/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/src/repositories/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class GlobalContextImpl implements GlobalContext {
  final GlobalKey<NavigatorState> navigatorKey;
  final AuthRepository authRepository;

  GlobalContextImpl({
    required this.navigatorKey,
    required this.authRepository,
  });

  @override
  Future<void> loginExpire() async {
    final context = navigatorKey.currentContext;

    final sp = await SharedPreferences.getInstance();
    sp.clear();

    if (context != null && context.mounted) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Login expirado.",
          backgroundColor: ColorsApp.instance.primary,
        ),
        overlayState: navigatorKey.currentState!.overlay,
      );

      navigatorKey.currentState!.pushNamedAndRemoveUntil("/", (route) => false);
    }
  }
}
