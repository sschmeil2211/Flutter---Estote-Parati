// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/const.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class GroupPlanSectionScreen extends StatelessWidget {
  const GroupPlanSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            color: const Color(0xFFFFE599),
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index){
                return CustomizedCard(
                  headerTextColor: Colors.black,
                  color: const Color(0xFFFFE599),
                  headerText: 'DIAGNOSTICO',
                  body: Column(
                    children: [
                      const Text(
                          'Necesidad de que los beneficios desarrollen su Fe. Además, la Parroquia solicita al grupo que participe'
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) => const Icon(Icons.circle)),
                        ),
                      )
                    ],
                  )
                );
                /*return DataCard(
                  color: const Color(0xFFFFE599),
                  content: Column(
                    children: [
                      const Text(
                        'Necesidad de que los beneficios desarrollen su Fe. Además, la Parroquia solicita al grupo que participe'
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) => const Icon(Icons.circle)),
                        ),
                      )
                    ],
                  ),
                  titleColor: Colors.black,
                  title: 'DIAGNOSTICO',
                  cornerText: '',
                );*/
              },
            ),
          )
      ),
    );
  }
}