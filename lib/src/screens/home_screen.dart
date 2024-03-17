// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/const.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: const MenuBottomNavigationBar(selectedTab: ApplicationTab.HOME),
      backgroundColor: groupColor,
      body: CustomBackground(
        containerHeight: height * 0.85,
        extraHeaderTitle: 'Misiones',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            const AnnouncementCard(
              type: 'Taller',
              title: 'Orientación para chicos con discapacidad',
              date: '21/04',
              hour: '11:00 - 14:00',
              color: scoutColor,
            ),
            const AnnouncementCard(
              type: 'Próximo Consejo',
              title: 'Finanzas, Anual, Invierno, Educadores',
              date: '21/04',
              hour: '20:00',
              color: groupColor,
            ),
            CardBlock(
              blockName: 'Ciclos',
              children: List.generate(4, (index) => CustomCard(
                hasImage: true,
                color: branchColors[index],
                corner: const Icon(Icons.more_vert, color: Colors.white),
                content: Image.asset(
                  alignment: Alignment.bottomLeft,
                  height: 85,
                  branchLogos[index],
                  fit: BoxFit.contain,
                ),
              )),
            ),
          ],
        )
      )
    );
  }
}