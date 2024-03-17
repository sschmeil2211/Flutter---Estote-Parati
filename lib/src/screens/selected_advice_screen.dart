// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import 'package:estote_parati/src/utils/const.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class SelectedAdvicesScreen extends StatelessWidget {
  const SelectedAdvicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    List<String> sections = ['FINANZAS', 'ANUAL', 'BAÑOS'];

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
          children: List.generate(sections.length, (index) => Container(
            color: index == 0 ? scoutColor : groupColor,
            child: DataCard(
              titleColor: Colors.white,
              cornerText: 'T${index + 1}',
              color: groupColor,
              title: sections[index],
              content: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Turpis in eu mi bibendum neque. Lacus laoreet non curabitur gravida arcu. Morbi tristique senectus et netus et malesuada fames. Pulvinar mattis nunc sed blandit libero volutpat sed cras. Mauris ultrices eros in cursus turpis massa.',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ))
        ),
      ),
    );
  }
}
