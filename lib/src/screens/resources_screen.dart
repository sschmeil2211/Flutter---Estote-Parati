// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/const.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    List<String> titles = ['Actividades', 'Textos'];
    List<String> route = ['lastAdvicesScreen', 'groupPlan', 'inventoryScreen'];

    return Scaffold(
        bottomNavigationBar: const MenuBottomNavigationBar(selectedTab: ApplicationTab.resource),
        backgroundColor: groupColor,
        body: CustomizedBackground(
          backgroundHeader: 'S.A.',
          child: Column(
            children: [
              Column(
                children: List.generate(titles.length, (index) => InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CustomizedCard(
                      color: groupColor,
                      headerText: titles[index],
                      footerIcon: Icons.update,
                      footerText: 'Marzo 2023',
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, route[index]),
                )),
              ),
              const ImageCardBlock(
                blockName: 'Scouts de Argentina',
                colors: [Color(0xFF187DEE), Color(0xFF187DEE)],
                imagePaths: saLogos,
              )
            ],
          )
        )
    );
  }
}