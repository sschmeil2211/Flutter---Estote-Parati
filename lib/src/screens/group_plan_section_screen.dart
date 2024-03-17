// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import 'package:estote_parati/src/utils/const.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class GroupPlanSectionScreen extends StatelessWidget {
  const GroupPlanSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: scoutColor,
      appBar: AppBar(
        backgroundColor: scoutColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
        ),
        title: const Text(
          'VALORES',
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
          child: Container(
            color: Color(0xFFFFE599),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index){
                return DataCard(
                  color: Color(0xFFFFE599),
                  content: Column(
                    children: [
                      Text(
                        'Necesidad de que los beneficios desarrollen su Fe. Además, la Parroquia solicita al grupo que participe'
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) => Icon(Icons.circle)),
                        ),
                      )
                    ],
                  ),
                  titleColor: Colors.black,
                  title: 'DIAGNOSTICO',
                  cornerText: '',
                );
              },
            ),
          )
      ),
    );
  }
}