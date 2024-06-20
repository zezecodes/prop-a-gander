import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vodafone/features/homepage/presentation/pages/list_page.dart';
import 'package:vodafone/router/routes.dart';
import 'package:vodafone/themes/theme_provider.dart'; 
import 'package:vodafone/themes/themes.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context, ref) {
    final appThemeState = ref.watch(themeToggle);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode:
          appThemeState.lightModeEnable ? ThemeMode.light : ThemeMode.dark,
      title: 'Flutter Demo',
      initialRoute: "/",
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
