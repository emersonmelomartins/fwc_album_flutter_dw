import 'package:flutter/material.dart';
import 'package:fwc_album_app/src/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/src/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/src/core/ui/widgets/button.dart';
import 'package:fwc_album_app/src/core/ui/widgets/rounded_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
            onPressed: () {},
            height: 300,
          ),
          Button.primary(label: "Outro", onPressed: () {}, width: 200,),
          RoundedButton(icon: Icons.abc, onPressed: () {},),
        ],
      )),
    );
  }
}
