import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:paw_patrol/style/theme/app_themes.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  bool isDark = false;

  ThemeBloc() : super(AppTheme.lightTheme) {
    on<InitialThemeSetEvent>((event, emit) async {
      if (isDark) {
        emit(AppTheme.darkTheme);
      } else {
        emit(AppTheme.lightTheme);
      }
    });
    on<ThemeSwitchEvent>((event, emit) {
      isDark = !isDark;
      if (isDark) {
        emit(AppTheme.darkTheme);
      } else {
        emit(AppTheme.lightTheme);
      }
    });
  }
}
