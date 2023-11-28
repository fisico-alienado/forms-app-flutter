import 'package:flutter/material.dart';

class AppTheme {


  ThemeData getTheme() {
    const seedColor = Colors.deepPurple;

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      listTileTheme: const ListTileThemeData(
        iconColor: seedColor // hace que los iconos también tengan color (en este caso los del homeScreen), sin necesidad de un gestor de estado que los cambie¿¿??
      )
    );
  }
}