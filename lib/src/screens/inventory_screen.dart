// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/const.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scoutColor,
      appBar: AppBar(
        backgroundColor: scoutColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.white),
        ),
        title: const Text(
          'INVENTARIO',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(50)),
      child: Container(
        height: double.infinity,
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(38),
          children: List.generate(10, (index) => Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ITEM $index',
                    style: const TextStyle(
                        color: groupColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const Text(
                    '20',
                    style: TextStyle(
                        color: groupColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
          ),
          ),
        ),
      )),
    );
  }
}
