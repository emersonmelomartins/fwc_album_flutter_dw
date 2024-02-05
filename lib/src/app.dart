import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/src/core/rest/custom_dio.dart';
import 'package:fwc_album_app/src/core/ui/global/global_context.dart';
import 'package:fwc_album_app/src/core/ui/global/global_context_impl.dart';
import 'package:fwc_album_app/src/core/ui/theme/theme_config.dart';
import 'package:fwc_album_app/src/pages/auth/login/login_route.dart';
import 'package:fwc_album_app/src/pages/auth/register/register_route.dart';
import 'package:fwc_album_app/src/pages/home/home_route.dart';
import 'package:fwc_album_app/src/pages/my_stickers/my_stickers_page.dart';
import 'package:fwc_album_app/src/pages/splash/splash_route.dart';
import 'package:fwc_album_app/src/repositories/auth/auth_repository.dart';
import 'package:fwc_album_app/src/repositories/auth/auth_repository_impl.dart';

class App extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>(
          (i) => AuthRepositoryImpl(dio: i()),
        ), // i() = Callable Class
        Bind.lazySingleton<GlobalContext>(
          (i) => GlobalContextImpl(
            navigatorKey: navigatorKey,
            authRepository: i(),
          ),
        ),
      ],
      child: MaterialApp(
        title: "Fifa World Cup Album",
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeConfig.theme,
        routes: {
          "/": (_) => const SplashRoute(),
          "/auth/login": (_) => const LoginRoute(),
          "/auth/register": (_) => const RegisterRoute(),
          "/home": (_) => HomeRoute(),
          "/my-stickers": (_) => const MyStickersPage(),
        },
      ),
    );
  }
}
