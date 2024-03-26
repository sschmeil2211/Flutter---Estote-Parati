import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/utils.dart';

class MissionsModal extends StatelessWidget {
  const MissionsModal({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> missions = ['Patios', 'Baño Entrada', 'Baño Salida', 'Quincho'];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(branchColors.length, (index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
        color: groupColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(missions[index], style: bodyStyle),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: branchColors[index]),
                borderRadius: BorderRadius.circular(50),
                color: darkenColor(groupColor),
              ),
              padding: const EdgeInsets.all(15),
              child: Image.asset(scarfs[index], height: 50),
            ),
          ],
        ),
      )),
    );
  }
}
