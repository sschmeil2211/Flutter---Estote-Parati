// ignore_for_file: unnecessary_this

import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/const.dart';

class CustomBackground extends StatelessWidget {
  final String? extraHeaderTitle;
  final double containerHeight;
  final Widget child;

  const CustomBackground({
    this.extraHeaderTitle,
    required this.containerHeight,
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: HeaderDelegate(
            context: context,
            extraHeaderTitle: extraHeaderTitle
          ),
        ),
        SliverToBoxAdapter(
          child: Stack(
            children: [
              if(this.extraHeaderTitle != null)
                Container(
                  color: scoutColor,
                  height: 150,
                  width: 50,
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50)
                      ),
                    ),
                    height: this.containerHeight,
                    width: double.infinity,
                    padding: const EdgeInsets.all(28),
                    child: this.child,
                  ),
                ],
              ),
            ],
          )
        )
      ],
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final String? extraHeaderTitle;
  final BuildContext context;

  const HeaderDelegate({
    this.extraHeaderTitle,
    required this.context,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double progress = shrinkOffset / maxExtent;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          left: width * 0.4,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: 1 - progress,
            child: Transform.rotate(
              angle: -25 * 3.14 / 180,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Image.asset(
                  height: height * 0.35,
                  sjoGreen,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        if(this.extraHeaderTitle != null)
          Positioned(
            bottom: 0,
            left: 0,
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                decoration: const BoxDecoration(
                  color: scoutColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50)
                  )
                ),
                alignment: Alignment.center,
                child: Text(
                  this.extraHeaderTitle!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              onTap: (){},
            ),
          )
      ],
    );
  }

  @override
  double get maxExtent => MediaQuery.of(this.context).size.height * 0.25;

  @override
  double get minExtent => MediaQuery.of(this.context).size.height * 0.05;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}