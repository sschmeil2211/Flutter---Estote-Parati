// ignore_for_file: unnecessary_this

import 'package:estote_parati/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ImageCardBlock extends StatelessWidget {
  final String blockName;
  final List<String> imagePaths;
  final List<Color> colors;

  const ImageCardBlock({
    required this.blockName,
    required this.imagePaths,
    required this.colors,
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 1.3,
            mainAxisSpacing: 10
          ),
          children: List.generate(this.imagePaths.length, (index) => ImageCard(
            imagePath: this.imagePaths[index],
            color: this.colors[index],
          ))
        )
      ],
    );
  }
}