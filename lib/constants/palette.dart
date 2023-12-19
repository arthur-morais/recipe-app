import 'package:flutter/material.dart';

class AppPalette {
  AppPalette._();

  static const MaterialColor pallete = MaterialColor(
    _palletePrimaryValue,
    <int, Color>{
      50: Color(0xFFFCE8E8),
      100: Color(0xFFF6C5C5),
      200: Color(0xFFF19F9F),
      300: Color(0xFFEB7878),
      400: Color(0xFFE65B5B),
      500: Color(_palletePrimaryValue),
      600: Color(0xFFDF3838),
      700: Color(0xFFDA3030),
      800: Color(0xFFD62828),
      900: Color(0xFFCF1B1B),
    },
  );

  static const int _palletePrimaryValue = 0xFFE23E3E;

  static const MaterialColor palleteAccent = MaterialColor(
    _palleteAccentValue,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      200: Color(_palleteAccentValue),
      400: Color(0xFFFF9D9D),
      700: Color(0xFFFF8484),
    },
  );

  static const int _palleteAccentValue = 0xFFFFD0D0;
}
