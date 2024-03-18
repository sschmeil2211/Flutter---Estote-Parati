// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';

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
              height: height * 0.2,
              color: index == 0 ? Colors.white : Color(colors[index-1]),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-5, -5),
                        blurRadius: 10,
                        color: Colors.black38
                    )
                  ],
                ),
                child: CustomizedCard(
                  color: Color(colors[index]),
                  headerText: '',
                  body: Center(
                    child: Text(sections[index])
                  ),
                )
              ),
            ),
            onTap: () => Navigator.pushNamed(context, 'groupPlanSection'),
          )),
        )
      ),
    );
  }
}