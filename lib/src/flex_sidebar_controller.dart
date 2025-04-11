import 'package:flutter/material.dart';

class FlexSidebarController {
  const FlexSidebarController(
      {this.currentIndex,
      this.pinned = true,
      this.maxWidth = 300,
      this.minWidth = 60,
      this.resizeAnimCurve = Curves.easeOutCirc,
      this.normalDecoration = const BoxDecoration(
          borderRadius:
              BorderRadiusDirectional.horizontal(end: Radius.circular(40)),
          color: Color.fromARGB(255, 171, 228, 255)),
      this.minimizedDecoration = const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Color.fromARGB(255, 119, 212, 255))});
  final int? currentIndex;
  final bool pinned;
  final double maxWidth;
  final double minWidth;
  final BoxDecoration normalDecoration;
  final BoxDecoration minimizedDecoration;
  final Curve resizeAnimCurve;
}
