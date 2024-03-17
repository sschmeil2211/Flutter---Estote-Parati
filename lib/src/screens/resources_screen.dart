// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/const.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        bottomNavigationBar: const MenuBottomNavigationBar(selectedTab: ApplicationTab.RESOURCES),
        backgroundColor: groupColor,
        body: CustomBackground(
            containerHeight: height * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomCard(
                  color: groupColor,
                  corner: Container(),
                  content: Container(
                    alignment: Alignment.centerLeft,
                    height: 130,
                    child: Text(
                      'Actividades',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                CustomCard(
                  color: groupColor,
                  corner: Container(),
                  content: Container(
                    alignment: Alignment.centerLeft,
                    height: 130,
                    child: Text(
                      'Textos',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                CardBlock(
                  crossAxisCount: 3,
                  blockName: 'Scouts de Argentina',
                  children: List.generate(3, (index) => CustomCard(
                    hasImage: true,
                    color: const Color(0xFF187DEE),
                    corner: const Icon(Icons.link, color: Colors.white),
                    content: Image.asset(
                      alignment: Alignment.bottomLeft,
                      height: 85,
                      saLogos[index],
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