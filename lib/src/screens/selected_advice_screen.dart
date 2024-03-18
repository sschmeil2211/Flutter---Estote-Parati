// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/const.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class SelectedAdvicesScreen extends StatelessWidget {
  const SelectedAdvicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  color: groupColor,
                  headerText: sections[index],
                  corner: Text('T${index + 1}'),
                  body: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Turpis in eu mi bibendum neque. Lacus laoreet non curabitur gravida arcu. Morbi tristique senectus et netus et malesuada fames. Pulvinar mattis nunc sed blandit libero volutpat sed cras. Mauris ultrices eros in cursus turpis massa.',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
              ),
            )
          ))
        ),
      ),
    );
  }
}
