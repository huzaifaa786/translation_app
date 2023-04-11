import 'package:flutter/material.dart';
import 'package:translation/values/colors.dart';

class Styles {
  Styles._();

  // Themes

  static final ColorScheme _colorSchemelight = const ColorScheme.light().copyWith(
    primary: greenish,
  );

  static final ColorScheme _colorSchemedark = const ColorScheme.dark().copyWith(
    primary: greenish,
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: _colorSchemelight,
    fontFamily: "Mazzard",
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: _colorSchemedark,
    fontFamily: "Mazzard",
  );
}