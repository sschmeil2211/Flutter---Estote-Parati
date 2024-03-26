// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';

import 'package:estote_parati/src/widgets/widgets.dart';
import 'package:estote_parati/src/utils/utils.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle itemsStyle = subtitleStyle.copyWith(color: groupColor);

    return Scaffold(
      backgroundColor: scoutColor,
      appBar: CustomizedAppBar(title: 'INVENTARIO', context: context),
      body: BodyWithList(
        children: List.generate(10, (index) => Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ITEM $index', style: itemsStyle),
              Text('20', style: itemsStyle),
            ],
          ),
        )),
      )
    );
  }
}
