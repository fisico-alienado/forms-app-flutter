import 'package:flutter/material.dart';
import 'package:forms_bloc_app/config/router/app_router.dart';
import 'package:forms_bloc_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Formularios y Notificacones con Flutter BLoC',
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}
