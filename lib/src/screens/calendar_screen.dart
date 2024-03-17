// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import 'package:estote_parati/src/utils/const.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    List<String> titles = ['Consejos', 'Plan de grupo', 'Inventario'];
    List<String> route = ['lastAdvicesScreen', 'groupPlan', 'inventoryScreen'];

    return Scaffold(
        bottomNavigationBar: const MenuBottomNavigationBar(selectedTab: ApplicationTab.CALENDAR),
        backgroundColor: groupColor,
        body: CustomBackground(
          containerHeight: height * 0.75,
          extraHeaderTitle: 'Póximo Consejo 06/04',
          child: Placeholder()
        )
    );
  }
}
