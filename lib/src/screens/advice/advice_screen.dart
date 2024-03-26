// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/utils.dart';
import 'package:estote_parati/src/widgets/widgets.dart';
import 'package:estote_parati/src/models/models.dart';

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomizedCardElements> cards = CustomizedCardElements.adviceCards;

    return Scaffold(
      bottomNavigationBar: const MenuBottomNavigationBar(selectedTab: ApplicationTab.advice),
      backgroundColor: groupColor,
      body: ScrollableBody(
        onTap: () => Navigator.pushNamed(context, 'calendarScreen'),
        backgroundHeader: 'Calendario',
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: cards.map((e) => InkWell(
            child: CustomizedCard(
              color: e.color,
              headerText: e.headerText,
              footerIcon: e.footerIcon,
              footerText: e.footerText,
            ),
            onTap: () => Navigator.pushNamed(context, e.route!),
          )).toList()
        )
      )
    );
  }
}
