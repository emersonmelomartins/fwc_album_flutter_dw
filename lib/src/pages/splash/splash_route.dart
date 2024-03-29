import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/src/pages/splash/presenter/splash_presenter.dart';
import 'package:fwc_album_app/src/pages/splash/presenter/splash_presenter_impl.dart';
import 'package:fwc_album_app/src/pages/splash/splash_page.dart';

class SplashRoute extends FlutterGetItPageRoute {
  const SplashRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<SplashPresenter>((i) => SplashPresenterImpl()),
      ];

  @override
  WidgetBuilder get page => (context) => SplashPage(presenter: context.get());
}
