import 'package:estote_parati/src/utils/consts/colors.dart';
import 'package:estote_parati/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ApplicationTab {
  home,
  advice,
  resource,
}

class MenuBottomNavigationBar extends StatelessWidget {
  final ApplicationTab selectedTab;

  const MenuBottomNavigationBar({required this.selectedTab, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 12,
      unselectedFontSize: 12,
      elevation: 0,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      currentIndex: selectedTab.index,
      type: BottomNavigationBarType.fixed,
      items: [
        buildBottomNavigationBarItem(FontAwesomeIcons.house , 'Inicio'),
        buildBottomNavigationBarItem(FontAwesomeIcons.peopleGroup, 'Consejo'),
        buildBottomNavigationBarItem(FontAwesomeIcons.bookOpen, 'Recursos'),
      ],
      onTap: (int index) {
        final tab = ApplicationTab.values[index];
        if (tab == selectedTab) return;
        switch (tab) {
          case ApplicationTab.home:
            Navigator.pushReplacementNamed(context, 'homeScreen');
            break;
          case ApplicationTab.advice:
            Navigator.pushReplacementNamed(context, 'adviceScreen');
            break;
          case ApplicationTab.resource:
            Navigator.pushReplacementNamed(context, 'resourcesScreen');
            break;
        }
      },
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(IconData iconName, String label) {
    return BottomNavigationBarItem(
      activeIcon: Icon(iconName, color: groupColor.withOpacity(0.75)),
      icon: Icon(iconName, color: groupColor),
      label: label
    );
  }
}
