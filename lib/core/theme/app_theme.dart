import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF6C5CE7);
  static const Color secondaryColor = Color(0xFF74B9FF);
  static const Color accentColor = Color(0xFFE17055);
  static const Color successColor = Color(0xFF00B894);
  static const Color warningColor = Color(0xFFE17055);
  static const Color errorColor = Color(0xFFD63031);

  static final lightColorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
  );

  static final darkColorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: lightColorScheme,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        elevation: 8,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: darkColorScheme,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        elevation: 8,
      ),
    );
  }


  static ThemeData getThemeData(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.light:
      default:
        return lightTheme;
    }
  }
}