import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String url;
  final Icon icon;

  const MenuItems({
    required this.title,
    required this.subTitle,
    required this.url,
    required this.icon,
  });
}

const menuList = <MenuItems>[
  MenuItems(
    title: 'Botones',
    subTitle: 'Todos los botones',
    url: '/buttons',
    icon: Icon(Icons.smart_button_outlined),
  ),
  MenuItems(
    title: 'Cartas',
    subTitle: 'Todas las cartas',
    url: '/cards',
    icon: Icon(Icons.cases_rounded),
  ),
  MenuItems(
    title: 'Animaciones',
    subTitle: 'Todos las animaciones',
    url: '/animations',
    icon: Icon(Icons.animation),
  ),
  MenuItems(
    title: 'Tutorial',
    subTitle: 'Todos los tutoriales',
    url: '/tutorial',
    icon: Icon(Icons.scatter_plot),
  ),
  MenuItems(
    title: 'Scroll',
    subTitle: 'Todos los scroll',
    url: '/scroll',
    icon: Icon(Icons.screen_rotation_alt_outlined),
  ),
  MenuItems(
    title: 'Progreso',
    subTitle: 'Todos los progresos',
    url: '/progress',
    icon: Icon(Icons.replay_circle_filled_sharp),
  ),
  MenuItems(
    title: 'Snackbars',
    subTitle: 'Todos los snackbars',
    url: '/snackbars',
    icon: Icon(Icons.branding_watermark_rounded),
  ),
  MenuItems(
    title: 'Ui',
    subTitle: 'Todos los controles',
    url: '/uicontrols',
    icon: Icon(Icons.interests),
  ),
  MenuItems(
    title: 'Ordenar comida',
    subTitle: 'Restaurante ',
    url: '/ordenar',
    icon: Icon(Icons.food_bank),
  ),
];
