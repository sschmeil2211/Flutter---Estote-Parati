// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/const.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    List<String> titles = ['Consejos', 'Plan de grupo', 'Inventario'];
    List<String> route = ['lastAdvicesScreen', 'groupPlan', 'inventoryScreen'];

    return Scaffold(
      bottomNavigationBar: const MenuBottomNavigationBar(selectedTab: ApplicationTab.ADVICE),
      backgroundColor: groupColor,
      body: CustomBackground(
        containerHeight: height * 0.75,
        extraHeaderTitle: 'Póximo Consejo 06/04',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(titles.length, (index) => InkWell(
            child: CustomCard(
              color: groupColor,
              corner: Container(),
              content: Container(
                alignment: Alignment.centerLeft,
                height: 130,
                child: Text(
                  titles[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            onTap: () => Navigator.pushNamed(context, route[index]),
          )),
        )
      )
    );
  }
}
