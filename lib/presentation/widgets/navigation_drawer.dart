import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/config/menuItems/menu_items.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomNavigationDrawer({super.key, required this.scaffoldKey});
  @override
  State<CustomNavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<CustomNavigationDrawer> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        final menuItem = menuList[value];
        context.push(menuItem.url);

        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(10, hasNotch ? 20 : 10, 10, 20),
          child: Text('Main'),
        ),
        ...menuList
            .sublist(0, 3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: item.icon,
                label: Text(item.title),
              ),
            ),
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(10, 10, 10, 20),
          child: Divider(),
        ),
        Padding(padding: const EdgeInsets.all(20), child: Text('Otros')),
        ...menuList
            .sublist(3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: item.icon,
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
