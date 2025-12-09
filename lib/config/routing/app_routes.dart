import 'package:flutter/widgets.dart';
import 'package:flutter_widgets_app/presentation/home_page.dart';
import 'package:flutter_widgets_app/presentation/screens/counter_screen.dart';
import 'package:flutter_widgets_app/presentation/screens/error_screen.dart';
import 'package:flutter_widgets_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  errorBuilder: (context, state) => ErrorScreen(),

  ///Cambiar a gusto en caso de querer inicial en otra pantalla
  initialLocation: '/',
  routes: [
    GoRoute(
      name: MyHomePage.name,
      path: '/',
      builder: (context, state) => MyHomePage(title: 'Karbon Zero App'),
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: ButtonsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position:
                  Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(
                    CurveTween(curve: Curves.easeInOutCubic).animate(animation),
                  ),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: CardsScreen.name,
      path: '/cards',
      builder: (context, state) => CardsScreen(),
    ),
    GoRoute(
      name: AnimatedScreen.name,
      path: '/animations',
      builder: (context, state) => AnimatedScreen(),
    ),
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
    GoRoute(
      path: '/counter',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: CounterScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position:
                  Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(
                    CurveTween(curve: Curves.easeInOutCubic).animate(animation),
                  ),
              child: child,
            );
          },
        );
      },
    ),
  ],
);
