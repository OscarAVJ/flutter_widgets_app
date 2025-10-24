import 'package:flutter/material.dart';

///Widget que se llama en el main
class MyHomePage extends StatefulWidget {
  ///Constructor, pide el titulo de la app
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

///Estado
class _MyHomePageState extends State<MyHomePage> {
  ///Valor del contador
  final int _counter = 0;
  ///Valor del selectedIndex para el bottomNavigationBar
  int _selectedIndex = 0;

  ///Lista de widgets que tendremos, late es para decirle que a pesar de que va a ser un final, su inicializacion sera tardia
  // ignore: unused_field
  late final List<Widget> _menuItems;


  ///Metodo que se ejecuta al iniciar el widget o su estado inicial
  @override
  void initState() {
    super.initState();
    ///Menu Items tendra 2 huevos indices el 0 sera el counterScreen y el otro el hello de kz
    _menuItems = [_CounterScreen(counter: _counter), _KarbonZeroHello()];
  }

  ///Aca definimos el metodo que se va a ejecutar al darle tap a un item del BNB
  void _onItemTapped(int index) {
    ///Cambiamos el estado
    setState(() {
      ///Ahora el selectedIndex tendra el valor del indice que tenga nuestro BNB
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ///Estructura de Scaffols
    return Scaffold(
      ///AppBar
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: Image.network(
              'https://res.cloudinary.com/dtxerr5sz/image/upload/v1760503417/boredParrot_evl0kr.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      ///Body, el cual sera en base a los menuItems pero el selectedIndex, en caso sea 0 o 1
      body: _menuItems.elementAt(_selectedIndex),
      ///Definimos el BNV
      bottomNavigationBar: BottomNavigationBar(
        ///Aca van los items, es un array de Widgets y pues tienen un BNBItem, label es required
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categorias",
          ),
        ],
        ///Current Index le indica al bottom navigation bar a cual hacer el enfasis o el zoom
        currentIndex: _selectedIndex,
        ///On tap es la funcion que se ejecutara al darle tap
        onTap: _onItemTapped,
      ),
    );
  }
}

// ignore: must_be_immutable
class _CounterScreen extends StatefulWidget {
  _CounterScreen({required int counter}) : _counter = counter;

  int _counter;

  @override
  State<_CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<_CounterScreen> {
  void _incrementCounter() {
    setState(() {
      widget._counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      widget._counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      widget._counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '${widget._counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (widget._counter >= 0) {
                _incrementCounter();
              } else {
                return;
              }
            },
            tooltip: 'Increment',
            child: const Icon(Icons.exposure_plus_1),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              if (widget._counter == 0) {
                return;
              } else {
                _decreaseCounter();
              }
            },
            tooltip: 'Increment',
            child: const Icon(Icons.exposure_minus_1),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: _resetCounter,
            tooltip: "Reset",
            child: Icon(Icons.restart_alt_outlined),
          ),
        ],
      ),
    );
  }
}

class _KarbonZeroHello extends StatefulWidget {
  const _KarbonZeroHello();

  @override
  State<_KarbonZeroHello> createState() => __KarbonZeroHelloState();
}

class __KarbonZeroHelloState extends State<_KarbonZeroHello> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
