import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/theme_provider.dart';

import 'package:meals_app/splash_screen.dart';
import 'package:meals_app/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        theme: theme,
        darkTheme: darkTheme,
        home: const SplashScreen(),
        themeMode: ref.watch(themeProvider) ? ThemeMode.dark : ThemeMode.light);
  }
}
