import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/di/service_locator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = sl<GoRouter>();
    return MaterialApp.router(
      title: 'Magic Workout',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5D5FEF)),
        useMaterial3: true,
      ),
    );
  }
}
