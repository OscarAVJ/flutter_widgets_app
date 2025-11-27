import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/config/menuItems/menu_items.dart';
import 'package:go_router/go_router.dart';

///Widget que se llama en el main
class MyHomePage extends StatefulWidget {
  ///Constructor, pide el titulo de la app
  static const String name = 'home_screen';
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

///Estado
class _MyHomePageState extends State<MyHomePage> {
  ///Valor del contador

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
    _menuItems = [_CounterScreen(), _WidgetMenu()];
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined),
            label: "Menu",
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
  const _CounterScreen();

  @override
  State<_CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<_CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final textDecoration = const TextStyle(fontWeight: FontWeight.bold);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          _CO2Counter(colors: colors),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text("Tipos de consumos", style: textDecoration),
                const Spacer(),
                TextButton(
                  onPressed: () => context.push('/cards'),
                  child: Text("Ver mas", style: textDecoration),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: const [CardImage(), CardImage(), CardImage()],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text("Canales", style: textDecoration),
                const Spacer(),
                TextButton(
                  onPressed: () => context.push('/buttons'),
                  child: Text("Ver mas", style: textDecoration),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [_MiniCard(icon: Icons.abc, label: 'kjk')],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _MiniCard extends StatelessWidget {
  const _MiniCard({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: ListTile(leading: Icon(icon), title: Text(label)),
    );
  }
}

class CardImage extends StatelessWidget {
  const CardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          'https://res.cloudinary.com/dtxerr5sz/image/upload/v1760503417/boredParrot_evl0kr.png',
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
        Text('data'),
      ],
    );
  }
}

class _CO2Counter extends StatelessWidget {
  const _CO2Counter({required this.colors});

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.center,
      child: Container(
        decoration: BoxDecoration(
          color: colors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 300,
        child: Text(
          "50tC02",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: colors.inversePrimary,
          ),
        ),
      ),
    );
  }
}

class _WidgetMenu extends StatefulWidget {
  const _WidgetMenu();

  @override
  State<_WidgetMenu> createState() => _WidgetMenuState();
}

class _WidgetMenuState extends State<_WidgetMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: menuList.length,
      itemBuilder: (context, index) {
        MenuItems menuItem = menuList[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.menuItem});

  final MenuItems menuItem;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: menuItem.icon,
      iconColor: colors.primary,
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      trailing: Icon(
        Icons.keyboard_arrow_right_outlined,
        color: colors.primary,
      ),
      onTap: () {
        // Navigator.of(
        //   context,
        // ).push(MaterialPageRoute(builder: (context) => ButtonsScreen()));
        context.push(menuItem.url);
      },
    );
  }
}
