import 'package:flutter/material.dart';

class FlexSidebarController {
  FlexSidebarController({
    int currentIndex = 0,
    bool pinned = true,
    Curve resizeAnimCurve = Curves.easeOutCirc,
  }) {
    _currentIndex = currentIndex;
    _pinned = pinned;
    _resizeAnimCurve = resizeAnimCurve;
  }
  late int _currentIndex;
  late bool _pinned;
  late Curve _resizeAnimCurve;

  int get index => _currentIndex;
  bool get pinned => _pinned;
  Curve get resizeAnimCurve => _resizeAnimCurve;

  void setIndex(int index) {
    _currentIndex = index;
  }

  void setPinned(bool pinned) {
    _pinned = pinned;
  }

  void setResizeAnimCurve(Curve animCurve) {
    _resizeAnimCurve = animCurve;
  }
}
