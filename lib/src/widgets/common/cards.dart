// ignore_for_file: unnecessary_this
import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/utils.dart';

class ImageCard extends StatelessWidget {
  final Color color;
  final String imagePath;
  final IconData icon;
  final Function() onTap;

  const ImageCard({
    required this.imagePath,
    required this.color,
    required this.icon,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: customSquare,
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
            InkWell(
              onTap: this.onTap,
              child: Corner(
                color: darkenColor(this.color, factor: 0.10),
                child: Icon(this.icon)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomizedCard extends StatelessWidget {
  final Color color;
  final Color? cornerColor;
  final Color headerTextColor;
  final String headerText;
  final Widget? corner;
  final Widget? body;
  final IconData? footerIcon;
  final String? footerText;

  const CustomizedCard({
    required this.color,
    this.cornerColor,
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

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: customSquare,
        boxShadow: cardShadows,
        color: this.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardHeader(
            headerText: this.headerText,
            color: this.cornerColor ?? darkenColor(this.color, factor: 0.10),
            corner: this.corner,
            headerTextColor: this.headerTextColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: this.body ?? SizedBox(height: height * 0.04),
          ),
          Footer(footerText: this.footerText ?? '', footerIcon: this.footerIcon)
        ],
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  final Color color;
  final Color? headerTextColor;
  final Widget? corner;
  final String headerText;

  const CardHeader({
    required this.color,
    required this.headerText,
    this.headerTextColor,
    this.corner,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 35, top: 25),
            child: Text(this.headerText, style: titleStyle.copyWith(color: this.headerTextColor)),
          ),
        ),
        Corner(color: this.color, child: this.corner)
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
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              this.footerIcon,
              color: Colors.white,
              size: 18,
            ),
          ),
          Text(this.footerText, style: simpleStyle)
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
    double size = 85;

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(color: this.color, borderRadius: cornerRadius),
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        alignment: Alignment.center,
        child: this.child
      ),
    );
  }
}