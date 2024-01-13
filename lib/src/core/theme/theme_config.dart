import 'package:flutter/material.dart';
import 'package:fwc_album_app/src/core/styles/colors_app.dart';
import 'package:fwc_album_app/src/core/styles/text_styles.dart';

final _defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(18),
  borderSide: BorderSide(
    color: ColorsApp.instance.greyDark,
    width: 1,
  ),
);

class ThemeConfig {
  ThemeConfig._();

  static final theme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyles.instance.textPrimaryFontBold.copyWith(
        color: Colors.black,
        fontSize: 18,
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    primaryColor: ColorsApp.instance.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instance.primary,
      primary: ColorsApp.instance.primary,
      secondary: ColorsApp.instance.secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      labelStyle: TextStyles.instance.labelTextField,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
    ),
  );
}
