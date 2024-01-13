import 'package:flutter/material.dart';
import 'package:fwc_album_app/src/core/styles/button_styles.dart';

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
          Text("Splash"),
          ElevatedButton(
            child: Text("Botão"),
            style: ButtonStyles.instance.yellowButton,
            onPressed: () {},
          ),
          OutlinedButton(
            child: Text("Botão 2"),
            style: ButtonStyles.instance.yellowOutlineButton,
            onPressed: () {},
          ),
          ElevatedButton(
            child: Text("Botão"),
            style: ButtonStyles.instance.primaryButton,
            onPressed: () {},
          ),
          OutlinedButton(
            child: Text("Botão 2"),
            style: ButtonStyles.instance.primaryOutlineButton,
            onPressed: () {},
          ),
          TextField(),
        ],
      )),
    );
  }
}
