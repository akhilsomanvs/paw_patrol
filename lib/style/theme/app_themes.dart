// enum AppTheme { light, dark }

import 'package:flutter/material.dart';

class AppTheme {
  static const String _lightTheme = 'Light';
  static const String _darkTheme = 'Dark';

  static final ColorScheme _lightColorScheme = _AppColorScheme.lightColorScheme;
  static final ColorScheme _darkColorScheme = _AppColorScheme.darkColorScheme;

  static final _theme = {
    _lightTheme: _createThemeData(_lightColorScheme),
    _darkTheme: _createThemeData(_darkColorScheme),
  };

  static ThemeData get lightTheme => _theme[_lightTheme]!;

  static ThemeData get darkTheme => _theme[_darkTheme]!;

  static ThemeData _createThemeData(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: colorScheme.primary,
      colorScheme: colorScheme,

      /// Primary Text Theme
      primaryTextTheme: TextTheme(
        bodyLarge: const TextStyle(
          fontSize: 18,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.underline,
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),

      /// Text Theme
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 32,
          fontWeight: FontWeight.w400,
          height: 1,
        ),
        bodyLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),

      // Dialog basic theme
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.background,
        surfaceTintColor: const Color.fromARGB(0, 255, 255, 255),
      ),
    );
  }
}

class _AppColorScheme {
  static const Color _primaryColor = Color(0xff2b2b2b);
  static const Color _secondaryColor = Color(0xffec5757);
  static const Color _surfaceColor = Color(0xfffafafa);
  static const Color _darkSurfaceColor = Color(0xff656565);

  static final ColorScheme lightColorScheme = const ColorScheme.light().copyWith(
    primary: _primaryColor,
    onPrimary: Colors.white,
    secondary: _secondaryColor,
    surface: _surfaceColor,
    background: Colors.white,
  );
  static final ColorScheme darkColorScheme = const ColorScheme.dark().copyWith(
    primary: Colors.white,
    onPrimary: _primaryColor,
    secondary: _secondaryColor,
    surface: _darkSurfaceColor,
    background: _primaryColor,
  );
}
