import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences sharedPreferences;
  ThemeBloc({required this.sharedPreferences}) : super(ThemeState(themeMode: _getInitialThemeMode(sharedPreferences))) {
    on<ThemeChanged>((event, emit) {
      emit(state.copyWith(themeMode: event.themeMode));
    });



    on<ThemeToggled>((event, emit) {
      emit(state.copyWith(
        themeMode: state.themeMode == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light,
      ));
    });
  }
  static ThemeMode _getInitialThemeMode(SharedPreferences prefs) {
    try {
      final index = prefs.getInt('themeMode');
      return index != null ? ThemeMode.values[index] : ThemeMode.system;
    } catch (e) {
      return ThemeMode.system;
    }
  }
}
