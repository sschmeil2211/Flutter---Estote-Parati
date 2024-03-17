// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:estote_parati/src/utils/const.dart';
import 'package:estote_parati/src/utils/functions.dart';

class DataCard extends StatelessWidget {
  final String cornerText;
  final Color titleColor;
  final Color color;
  final String title;
  final Widget content;

  const DataCard({
    required this.cornerText,
    required this.titleColor,
    required this.color,
    required this.title,
    required this.content,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.color,
        boxShadow: const [
          BoxShadow(
            offset: Offset(-10, -5),
            blurRadius: 10,
            color: Colors.black38
          )
        ],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(50)
        )
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.title,
                  style: TextStyle(
                    color: this.titleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),
                ),
                this.content,
              ],
            ),
          ),
          Corner(
            height: 85,
            color: this.color,
            child: Text(
              this.cornerText,
              style: const TextStyle(color: Colors.white)
            )
          )
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final bool hasImage;
  final Color color;
  final Widget content;
  final Widget corner;

  const CustomCard({
    this.hasImage = false,
    required this.color,
    required this.content,
    required this.corner,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.2,
      child: LayoutBuilder(
        builder: (context, constraints){
          double leftPadding = this.hasImage ? 0 : constraints.maxWidth * 0.10;
          double bottomPadding = this.hasImage ? 0 : constraints.maxHeight * 0.05;

          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: this.color,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: leftPadding, top: 25, right: 20, bottom: bottomPadding),
                    child: this.content,
                  ),
                ),
                Corner(
                  height: constraints.maxHeight * 0.5,
                  color: this.color,
                  child: corner
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

class Corner extends StatelessWidget {
  final double height;
  final Color color;
  final Widget child;

  const Corner({
    required this.height,
    required this.color,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: this.height,
        width: this.height,
        decoration: BoxDecoration(
          color: darkenColor(this.color, factor: 0.10),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(100),
            topRight: Radius.circular(10)
          )
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.center,
          child: this.child
        ),
      ),
    );
  }
}