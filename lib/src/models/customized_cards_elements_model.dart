import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/utils.dart';

class CustomizedCardElements{
  final Color color;
  final String headerText;
  final String? cornerText;
  final String? bodyText;
  final String footerText;
  final IconData footerIcon;
  final String? route;

  CustomizedCardElements({
    required this.color,
    required this.headerText,
    this.cornerText,
    this.bodyText,
    this.route,
    required this.footerText,
    required this.footerIcon
  });

  static List<CustomizedCardElements> get adviceCards => [
    CustomizedCardElements(
      color: groupColor,
      headerText: 'Consejos',
      footerText: 'Marzo 2023',
      footerIcon: Icons.update,
      route: 'lastAdvicesScreen'
    ),
    CustomizedCardElements(
      color: groupColor,
      headerText: 'Plan de grupo',
      footerText: 'Marzo 2023',
      footerIcon: Icons.update,
      route: 'groupPlan'
    ),
    CustomizedCardElements(
      color: groupColor,
      headerText: 'Inventario',
      footerText: 'Marzo 2023',
      footerIcon: Icons.update,
      route: 'inventoryScreen'
    ),
  ];

  static List<CustomizedCardElements> get resourceCards => [
    CustomizedCardElements(
        color: groupColor,
        headerText: 'Actividades',
        footerText: 'Marzo 2023',
        footerIcon: Icons.update,
        route: 'activitiesScreen'
    ),
    CustomizedCardElements(
        color: groupColor,
        headerText: 'Textos',
        footerText: 'Marzo 2023',
        footerIcon: Icons.update,
        route: 'activitiesScreen'
    ),
  ];
}