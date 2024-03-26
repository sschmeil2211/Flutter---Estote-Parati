import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:estote_parati/src/utils/utils.dart';

class LoadingProgressAnimation extends StatelessWidget {
  const LoadingProgressAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: leftRadius,
      child: Container(
        color: Colors.white,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(loading, height: 150),
          ],
        ),
      ),
    );
  }
}
