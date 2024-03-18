// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:estote_parati/src/utils/functions.dart';

class CustomizedCard extends StatelessWidget {
  final Color color;
  final Color headerTextColor;
  final String headerText;
  final Widget? corner;
  final Widget? body;
  final IconData? footerIcon;
  final String? footerText;

  const CustomizedCard({
    required this.color,
    required this.headerText,
    this.headerTextColor = Colors.white,
    this.corner,
    this.body,
    this.footerText,
    this.footerIcon,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        bottomLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: Container(
        color: this.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardHeader(
              headerTextColor: this.headerTextColor,
              headerText: this.headerText,
              color: this.color,
              corner: this.corner,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: this.body ?? SizedBox(height: height * 0.04),
            ),
            Footer(
              footerText: this.footerText ?? '',
              footerIcon: this.footerIcon,
            )
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final Color color;
  final String imagePath;

  const ImageCard({
    required this.imagePath,
    required this.color,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        bottomLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: Container(
        color: this.color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(this.imagePath, height: 85),
            ),
            Corner(
              color: color,
              child: const Icon(Icons.more_vert)
            ),
          ],
        ),
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  final Color color;
  final Color headerTextColor;
  final Widget? corner;
  final String headerText;

  const CardHeader({
    required this.color,
    required this.headerTextColor,
    this.corner,
    required this.headerText,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35, top: 25),
          child: Text(
            this.headerText,
            style: TextStyle(
              color: this.headerTextColor,
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Corner(
          color: this.color,
          child: this.corner
        )
      ],
    );
  }
}

class Footer extends StatelessWidget {
  final String footerText;
  final IconData? footerIcon;

  const Footer({
    required this.footerText,
    this.footerIcon,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if(this.footerIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                this.footerIcon,
                color: Colors.white,
                size: 18,
              ),
            ),
          Text(
            this.footerText,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class Corner extends StatelessWidget {
  final Color color;
  final Widget? child;

  const Corner({
    required this.color,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: 85,
      decoration: BoxDecoration(
        color: darkenColor(this.color, factor: 0.10),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(100),
        )
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        alignment: Alignment.center,
        child: this.child
      ),
    );
  }
}