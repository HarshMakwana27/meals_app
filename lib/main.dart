import 'package:flutter/material.dart';

import 'package:meals_app/splash_screen.dart';
import 'package:meals_app/theme/theme.dart';

void main() {
  runApp(const MainApp(true));
}

class MainApp extends StatelessWidget {
  const MainApp(this.isDark, {super.key});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        darkTheme: darkTheme,
        home: const SplashScreen(),
        themeMode: ThemeMode.system);
  }
}
