import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/config/theme/app_theme.dart';
import 'package:flutter_widgets_app/presentation/home_page.dart';
import 'package:flutter_widgets_app/presentation/screens/buttons_screen.dart';
import 'package:flutter_widgets_app/presentation/screens/cards_screen.dart';

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
    return MaterialApp(
      ///Titulo de la app
      title: 'Flutter Demo',

      ///Quitamos el banner feo
      debugShowCheckedModeBanner: false,

      ///ThemeData
      theme: AppTheme(selectedColor: 2).getTheme(),
      home: const MyHomePage(title: 'WidgetsApp'),
      routes: {
        '/buttons': (context) => ButtonsScreen(),
        '/cards': (context) => CardsScreen(),
      },
    );
  }
}
