import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress Screen"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () => context.pop(),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("Progress Indicator"),
            SizedBox(height: 10),
            _ProgressIndicator(),
            SizedBox(height: 10),
            Text("Controlled Progress Indicator"),
            SizedBox(height: 20),
            _ControlledProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return CircularProgressIndicator(
      strokeWidth: 2,
      backgroundColor: colors.outline,
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    ///Usar un stream builder para poder acceder a la data que tiene mediante su snapshot y validar su fin con takeWhile
    return StreamBuilder(
      ///Un stream es un tipo de funcion que retorna un valor cada cierto tiempo, recibe la duracion y tambien que retornara o la funcion
      stream: Stream.periodic(Duration(milliseconds: 300), (value) {
        return(value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final streamValue = snapshot.data ?? 0;
        return Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Row(
            children: [
              CircularProgressIndicator(
                value: streamValue,
                backgroundColor: colors.outline,
              ),
              SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator(
                  value: streamValue,
                  backgroundColor: colors.outline,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
