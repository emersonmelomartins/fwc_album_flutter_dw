import 'package:flutter/material.dart';
import 'package:fwc_album_app/src/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/src/core/ui/helpers/messages.dart';
import 'package:fwc_album_app/src/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/src/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/src/core/ui/widgets/button.dart';
import 'package:fwc_album_app/src/core/ui/widgets/rounded_button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with Loader<SplashPage>, Messages<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Button(
            style: context.buttonStyles.yellowButton,
            labelStyle: context.textStyles.textPrimaryFontBold,
            label: "Teste",
            onPressed: () async {
              showLoader();
              await Future.delayed(Duration(seconds: 1));
              hideLoader();
            },
            height: 300,
          ),
          Button.primary(
            label: "Outro",
            onPressed: () async {
              showError("Ocorreu um erro");
              await Future.delayed(Duration(seconds: 1));
              showInfo("Informativo");
              await Future.delayed(Duration(seconds: 1));
              showSuccess("Sucesso!");

            },
            width: 200,
          ),
          RoundedButton(
            icon: Icons.abc,
            onPressed: () {},
          ),
        ],
      )),
    );
  }
}
