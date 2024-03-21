import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  useMaterial3: false,
  fontFamily: 'Poppins',
  primaryColor: const Color(0xFFC02332),
  secondaryHeaderColor: const Color(0xFF000743),
  disabledColor: const Color(0xFFA0A4A8),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFFC02332))), colorScheme: const ColorScheme.light(primary: Color(0xFFC02332), secondary: Color(0xFFC02332)).copyWith(error: const Color(0xFFC02332)),
);