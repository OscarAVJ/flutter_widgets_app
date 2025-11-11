import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buttons screen")),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      ///Lo que hace esta propiedad es usar el ancho full de padre hasta lo que encuentre
      width: double.infinity,
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Elevated")),
            ElevatedButton(onPressed: null, child: Text("Elevated Disabled")),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text("Eleveated Icon"),
              icon: Icon(Icons.public_sharp),
            ),
            FilledButton(onPressed: () {}, child: Text("Filled")),
            FilledButton.icon(
              onPressed: () {},
              label: Text("Filled Icon"),
              icon: Icon(Icons.plumbing),
            ),
            FilledButton.tonal(onPressed: () {}, child: Text("Filled Tonal")),
            OutlinedButton(onPressed: () {}, child: Text("Outiline")),
            OutlinedButton.icon(
              onPressed: () {},
              label: Text("Outline Icon"),
              icon: Icon(Icons.icecream_outlined),
            ),
            TextButton(onPressed: () {}, child: Text("Texto Button")),
            TextButton.icon(onPressed: () {}, label: Text("Text Icon")),
            IconButton(onPressed: () {}, icon: Icon(Icons.abc_outlined)),
            IconButton.filled(
              onPressed: () {},
              icon: Icon(Icons.ac_unit_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.access_alarm),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
            _CustomButton(),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: Material(
        color: Colors.blue,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
            child: Text("Custom Button", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
