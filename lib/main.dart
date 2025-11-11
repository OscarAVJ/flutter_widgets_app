import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/config/routing/app_routes.dart';
import 'package:flutter_widgets_app/config/theme/app_theme.dart';

///Metodo main, donde todo inicia
void main() {
  runApp(const MyApp());
}

///El corazon de nuestr app, el widget Padre
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ///Creacion de MaterialApp
    return MaterialApp.router(
      ///Titulo de la app
      title: 'Flutter Demo',

      ///Quitamos el banner feo
      debugShowCheckedModeBanner: false,

      ///ThemeData
      theme: AppTheme(selectedColor: 0).getTheme(),

      routerConfig: router,
    );
  }
}
