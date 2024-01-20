import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/src/pages/auth/login/login_page.dart';
import 'package:fwc_album_app/src/services/login/login_service.dart';
import 'package:fwc_album_app/src/services/login/login_service_impl.dart';

class LoginRoute extends FlutterGetItPageRoute {
  const LoginRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<LoginService>(
            (i) => LoginServiceImpl(authRepository: i()))
      ];

  @override
  WidgetBuilder get page => (context) => const LoginPage();
}
