import 'package:flutter/material.dart';
// import 'package:ghibli/screens/home_screen.dart';
import 'package:ghibli/services/router_service.dart';
import 'package:ghibli/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Studio Ghibli',
      theme: AppTheme().getTheme(),
      routerConfig: RouterService().getRouter(),
    );
  }
}
