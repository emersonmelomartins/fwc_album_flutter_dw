import 'package:flutter/material.dart';
import 'package:fwc_album_app/src/app.dart';
import 'package:fwc_album_app/src/core/config/env/env.dart';

void main() async {
  await Env.instance.load();

  runApp(App());
}
