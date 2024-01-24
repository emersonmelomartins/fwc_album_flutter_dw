import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/src/core/rest/custom_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  context.get<CustomDio>().auth().get("/me");
                },
                child: Text("Testando Token")),
            ElevatedButton(
                onPressed: () async {
                  final sp = await SharedPreferences.getInstance();
                  sp.clear();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/", (route) => false);
                },
                child: Text("Sair")),
          ],
        ),
      ),
    );
  }
}
