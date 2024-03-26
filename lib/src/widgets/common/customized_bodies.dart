// ignore_for_file: unnecessary_this
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/utils.dart';


class BodyWithList extends StatelessWidget {
  final List<Widget> children;

  const BodyWithList({
    required this.children,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: leftRadius,
      child: Container(
        color: Colors.white,
        height: double.infinity,
        child: ListView(
          padding: const EdgeInsets.all(28),
          children: this.children
        ),
      )
    );
  }
}

class ScrollableBody extends StatelessWidget {
  final String backgroundHeader;
  final bool scrollable;
  final Widget child;
  final Function()? onTap;

  const ScrollableBody({
    this.scrollable = true,
    this.onTap,
    required this.child,
    required this.backgroundHeader,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: CustomScrollView(
        physics: this.scrollable ? null : const NeverScrollableScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: HeaderDelegate(context: context),
          ),
          SliverLayoutBuilder(
            builder: (context, constraints) => SliverToBoxAdapter(
              child: Stack(
                children: [
                  InkWell(
                    onTap: onTap,
                    borderRadius: rightRadius,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                      height: constraints.viewportMainAxisExtent,
                      decoration: const BoxDecoration(color: scoutColor, borderRadius: rightRadius),
                      child: Text(this.backgroundHeader, style: subtitleStyle),
                    ),
                  ),
                  Positioned.fill(
                    top: 50,
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: leftRadius),
                      height: height,
                      width: double.infinity,
                      padding: const EdgeInsets.all(28),
                      child: this.child,
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final BuildContext context;

  const HeaderDelegate({required this.context});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double progress = shrinkOffset / maxExtent;
    double textPosition = progress * MediaQuery.of(context).size.width * 0.45;
    double opacity = 1 - progress;

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 100),
          left: textPosition,
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('ESTOTE PARATI', style: logoTextStyle),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: opacity,
            child: Transform.rotate(
              angle: -25 * 3.14 / 180,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Image.asset(sjoGreen),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => MediaQuery.of(this.context).size.height * 0.2;

  @override
  double get minExtent => MediaQuery.of(this.context).size.height * 0.05;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}