import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarsScreen extends StatelessWidget {
  const SnackbarsScreen({super.key});

  ///Funcion para mostrar un snackbar/pedimos un BuilContext para pasarlo en el widget y un color
  void showSnackbar(BuildContext context, Color color) {
    ///En caso de que exista algun snackbar al ejecutar se limpia
    ScaffoldMessenger.of(context).clearSnackBars();

    ///En una constante creamos nuestro Snackbar
    final snackBar = SnackBar(
      content: Text("Holaaa"),
      backgroundColor: color,
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: "ok",
        onPressed: () {},
        backgroundColor: color,
      ),
    );

    ///Mostramos el snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Quieres continuar?"),
        content: Text(
          "Incididunt aute ipsum ullamco adipisicing cillum deserunt esse duis aute cupidatat officia exercitation ullamco deserunt. Ad eiusmod dolore ipsum laboris non. Labore ullamco labore adipisicing duis amet aute pariatur id veniam ea minim sint ea. Est pariatur est labore irure Lorem culpa id. Exercitation exercitation laborum voluptate nostrud cupidatat.",
        ),
        icon: Icon(Icons.tram_sharp),
        actions: [
          TextButton(onPressed: () => context.pop(), child: Text("Cancelar")),
          FilledButton(
            onPressed: () {
              showSnackbar(context, colors.outline);
              context.pop();
            },
            child: Text("Continuar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text("Snackbars")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonalIcon(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationName: "Widgets App",
                  children: [
                    Center(
                      child: Text(
                        "Ut id adipisicing quis aliqua labore ea ad culpa id magna aute enim. Non et nostrud non do aute cupidatat. Velit et cillum sit anim ex cillum ullamco sint officia irure. Labore cupidatat culpa exercitation occaecat eiusmod. Elit culpa ad magna commodo cupidatat voluptate mollit nisi dolore. Duis incididunt reprehenderit nostrud duis est anim amet quis mollit exercitation reprehenderit anim id ut.",
                        style: TextStyle(fontStyle: FontStyle.normal),
                      ),
                    ),
                  ],
                );
              },
              label: Text("Licencias"),
              icon: Icon(Icons.mobile_friendly_sharp),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text("Mostrar dialogo"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Mostrar snackbar"),
        onPressed: () => showSnackbar(context, colors.secondary),
      ),
    );
  }
}
