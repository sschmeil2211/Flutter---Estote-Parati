// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class CardBlock extends StatelessWidget {
  final int crossAxisCount;
  final String blockName;
  final List<Widget> children;

  const CardBlock({
    this.crossAxisCount = 2,
    required this.blockName,
    required this.children,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.blockName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: this.crossAxisCount,
            crossAxisSpacing: 10,
            childAspectRatio: 1.45,
            mainAxisSpacing: 10
          ),
          children: this.children
        )
      ],
    );
  }
}