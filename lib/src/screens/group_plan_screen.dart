// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import 'package:estote_parati/src/utils/const.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class GroupPlanScreen extends StatelessWidget {
  const GroupPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    List<String> sections = ['VALORES', 'PROGRAMA DE JOVENES', 'RECURSOS FINANCIEROS', 'GESTIÓN', 'ADULTOS EN MOVIMIENTO'];
    List<int> colors = [0xFFFFE599, 0xFFB6D7A8, 0xFFA2C4C9, 0xFFB4A7D6, 0xFFD5A6BD];

    return Scaffold(
      backgroundColor: scoutColor,
      appBar: AppBar(
        backgroundColor: scoutColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
        ),
        title: const Text(
          'OTROS CONSEJOS',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50)
        ),
        child: ListView(
          shrinkWrap: true,
          children: List.generate(sections.length, (index) => InkWell(
            child: Container(
              color: index == 0 ? Colors.white : Color(colors[index-1]),
              child: CustomCard(
                color: Color(colors[index]), content: Center(child: Text(sections[index])), corner: Container()
              ),
            ),
            onTap: () => Navigator.pushNamed(context, 'groupPlanSection'),
          )),
        )
      ),
    );
  }
}