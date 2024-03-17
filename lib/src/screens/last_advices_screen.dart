// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/const.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class LastAdvicesScreen extends StatelessWidget {
  const LastAdvicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    List<String> months = ['Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Dicciembre'];
    List<String> items = ['BAÑOS', 'ANUAL', 'FINANZAS'];

    String themes = items.asMap().entries.map((entry) => entry.value ).join(', ');

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
          children: List.generate(months.length, (index) => InkWell(
            child: Container(
              color: index == 0 ? scoutColor : groupColor,
              child: DataCard(
                titleColor: Colors.white,
                cornerText: '2023',
                color: groupColor,
                title: months[index],
                content: Text(
                  themes,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            onTap: () => Navigator.pushNamed(context, 'selectedAdvicesScreen'),
          ))
        ),
      )
    );
  }
}