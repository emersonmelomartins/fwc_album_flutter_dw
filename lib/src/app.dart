import 'package:flutter/material.dart';
import 'package:fwc_album_app/src/core/theme/theme_config.dart';
import 'package:fwc_album_app/src/pages/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fifa World Cup Album",
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      routes: {
        "/": (_) => const SplashPage(),
      },
    );
  }
}
