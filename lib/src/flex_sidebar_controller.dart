import 'package:flutter/material.dart';

class FlexSidebarController {
  const FlexSidebarController({
    this.currentIndex,
    this.pinned = true,
    this.resizeAnimCurve = Curves.easeOutCirc,
  });
  final int? currentIndex;
  final bool pinned;
  final Curve resizeAnimCurve;
}
