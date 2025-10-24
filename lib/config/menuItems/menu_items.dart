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
    title: '????',
    subTitle: 'Todos los ????',
    url: 'Url',
    icon: Icon(Icons.device_unknown),
  ),
];
