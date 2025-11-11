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
    GoRoute(
      name: AnimatedScreen.name,
      path: '/animations', builder: (context, state) => AnimatedScreen()),
    GoRoute(
      path: '/tutorial',
      builder: (context, state) => AppTutorialScreen(),
    ),
    GoRoute(
      path: '/scroll',
      builder: (context, state) => InfiniteScrollScreen(),
    ),
    GoRoute(path: '/progress', builder: (context, state) => ProgressScreen()),
    GoRoute(path: '/snackbars', builder: (context, state) => SnackbarsScreen()),
    GoRoute(
      path: '/uicontrols',
      builder: (context, state) => UiControlsScreen(),
    ),
  ],
);
