// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/const.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MenuBottomNavigationBar(selectedTab: ApplicationTab.home),
      backgroundColor: groupColor,
      body: CustomizedBackground(
        scrollable: true,
        backgroundHeader: 'Misiones',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomizedCard(
              color: scoutColor,
              headerText: 'Taller',
              corner: Text(
                '21/04',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
              body: Text(
                'Orientación para chicos con discpacidad',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              footerText: '11:00 - 14:00',
              footerIcon: Icons.watch_later_outlined,
            ),
            const CustomizedCard(
              color: groupColor,
              headerText: 'Próximo Consejo',
              corner: Text(
                '21/04',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
              body: Text(
                'Finanzas, Anual, Invierno, Educadores, Aplicacion',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              footerText: '20:00',
              footerIcon: Icons.watch_later_outlined,
            ),
            ImageCardBlock(
              blockName: 'Ciclos',
              imagePaths: branchLogos,
              colors: branchColors,
            ),
          ],
        )
      )
    );
  }
}