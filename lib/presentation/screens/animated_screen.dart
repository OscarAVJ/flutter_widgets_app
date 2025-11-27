import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  ///definimos las propiedades a manejar en el estado
  double height = 45;
  double widght = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();

    widght = random.nextInt(300) + 120;
    height = random.nextInt(300) + 120;
    borderRadius = random.nextInt(100) + 12;
    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: Center(
        child: AnimatedContainer(
          ///Tipo de animacion
          curve: Curves.easeInOutCubic,
          duration: Duration(milliseconds: 200),
          height: height <= 0 ? 0 : height,
          width: widght <= 0 ? 0 : widght,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              borderRadius <= 0 ? 0 : borderRadius,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
