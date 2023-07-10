import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:paw_patrol/data/local/sharedPrefs/secure_storage_util.dart';
import 'package:paw_patrol/style/theme/app_themes.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  final SecureStorageUtil _storageUtil;
  bool isDark = false;

  ThemeBloc(this._storageUtil) : super(AppTheme.lightTheme) {

    on<InitialThemeSetEvent>((event, emit) async {
      isDark = await _storageUtil.isDarkTheme;
      if (isDark) {
        emit(AppTheme.darkTheme);
      } else {
        emit(AppTheme.lightTheme);
      }
    });

    on<ThemeSwitchEvent>((event, emit) async {
      isDark = !isDark;
      await _storageUtil.setIsDarkTheme(isDark);
      add(InitialThemeSetEvent());
    });
  }
}
