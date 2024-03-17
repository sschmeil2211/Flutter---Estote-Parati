import 'package:flutter/material.dart';

enum ApplicationTab {
  HOME,
  ADVICE,
  CALENDAR,
  RESOURCES,
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
        buildBottomNavigationBarItem(Icons.home, 'Inicio'),
        buildBottomNavigationBarItem(Icons.people, 'Consejo'),
        buildBottomNavigationBarItem(Icons.calendar_today, 'Calendario'),
        buildBottomNavigationBarItem(Icons.book, 'Recursos'),
      ],
      onTap: (int index) {
        final tab = ApplicationTab.values[index];
        if (tab == selectedTab) return;
        switch (tab) {
          case ApplicationTab.HOME:
            Navigator.pushReplacementNamed(context, 'homeScreen');
            break;
          case ApplicationTab.ADVICE:
            Navigator.pushReplacementNamed(context, 'adviceScreen');
            break;
          case ApplicationTab.CALENDAR:
            Navigator.pushReplacementNamed(context, 'calendarScreen');
            break;
          case ApplicationTab.RESOURCES:
            Navigator.pushReplacementNamed(context, 'resourcesScreen');
            break;
        }
      },
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(IconData iconName, String label) {
    return BottomNavigationBarItem(
      activeIcon: Icon(iconName),
      icon: Icon(iconName),
      label: label
    );
  }
}
