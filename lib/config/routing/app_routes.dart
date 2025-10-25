import 'package:flutter_widgets_app/presentation/home_page.dart';
import 'package:flutter_widgets_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  ///Cambiar a gusto en caso de querer inicial en otra pantalla
  initialLocation: '/',
  routes: [
    GoRoute(
      name: MyHomePage.name,
      path: '/',
      builder: (context, state) => MyHomePage(title: 'WidgetsApp'),
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      name: CardsScreen.name,
      path: '/cards',
      builder: (context, state) => CardsScreen(),
    ),
  ],
);
