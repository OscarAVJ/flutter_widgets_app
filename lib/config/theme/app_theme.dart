import 'package:flutter/material.dart';

const colorsList = <Color>[
  Colors.blue,
  Colors.purple,
  Color.fromARGB(255, 37, 103, 39),
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0,
        "El color seleccionado debe de ser igual o mayor a 0",
      ),
      assert(
        selectedColor < colorsList.length,
        "El color seleccionado debe de ser menor a ${colorsList.length - 1}",
      );

  ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorSchemeSeed: colorsList[selectedColor],
      appBarTheme: AppBarTheme(centerTitle: true),
    );
  }
}
