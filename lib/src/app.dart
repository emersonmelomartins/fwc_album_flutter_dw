import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/src/core/rest/custom_dio.dart';
import 'package:fwc_album_app/src/core/ui/theme/theme_config.dart';
import 'package:fwc_album_app/src/pages/auth/login/login_page.dart';
import 'package:fwc_album_app/src/pages/home/home_page.dart';
import 'package:fwc_album_app/src/pages/splash/splash_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton((i) => CustomDio()),
      ],
      child: MaterialApp(
        title: "Fifa World Cup Album",
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        routes: {
          "/": (_) => const SplashRoute(),
          "/auth/login": (_) => const LoginPage(),
          "/home": (_) => const HomePage(),
        },
      ),
    );
  }
}
