// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/const.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    List<String> titles = ['Consejos', 'Plan de grupo', 'Inventario', 'Nominas'];
    List<String> route = ['lastAdvicesScreen', 'groupPlan', 'inventoryScreen'];

    return Scaffold(
      bottomNavigationBar: const MenuBottomNavigationBar(selectedTab: ApplicationTab.advice),
      backgroundColor: groupColor,
      body: CustomizedBackground(
        scrollable: true,
        backgroundHeader: 'Próximo 06/04',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(titles.length, (index) => InkWell(
            child: CustomizedCard(
              color: groupColor,
              headerText: titles[index],
              footerIcon: Icons.update,
              footerText: 'Marzo 2023',
            ),
            onTap: () => Navigator.pushNamed(context, route[index]),
          )),
        )
      )
    );
  }
}
