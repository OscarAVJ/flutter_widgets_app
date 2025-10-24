import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/screens/home.dart';

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

      ///Theme
      darkTheme: ThemeData.dark(),

      ///ThemeData
      theme: ThemeData(
        ///Material y color base
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 230, 18, 18),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
