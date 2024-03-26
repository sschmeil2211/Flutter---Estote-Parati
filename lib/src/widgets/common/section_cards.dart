// ignore_for_file: unnecessary_this
import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/utils.dart';
import 'package:estote_parati/src/widgets/widgets.dart';

class ImageCardBlock extends StatelessWidget {
  final String blockName;
  final List<String> imagePaths;
  final List<Color> colors;
  final IconData icon;
  final List<Function()> onTapFunctions;

  const ImageCardBlock({
    required this.blockName,
    required this.imagePaths,
    required this.colors,
    required this.icon,
    required this.onTapFunctions,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.blockName,
          style: titleStyle.copyWith(color: Colors.black)
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
            icon: this.icon,
            imagePath: this.imagePaths[index],
            color: this.colors[index],
            onTap: this.onTapFunctions[index],
          ))
        )
      ],
    );
  }
}