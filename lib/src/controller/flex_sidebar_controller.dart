import 'package:flutter/material.dart';

/// A controller class for managing the state of the FlexSidebar widget.
/// This includes properties for the current index, pinned state, and animation curve.
class FlexSidebarController {
  /// Creates a `FlexSidebarController` instance with default or custom values.
  ///
  /// Parameters:
  /// - [currentIndex]: The initial index of the selected item in the sidebar.
  /// - [pinned]: Whether the sidebar is pinned by default.
  /// - [resizeAnimCurve]: The animation curve used for resizing the sidebar.
  FlexSidebarController({
    int currentIndex = 0,
    bool pinned = true,
    Curve resizeAnimCurve = Curves.easeOutCirc,
  }) {
    _currentIndex = currentIndex;
    _pinned = pinned;
    _resizeAnimCurve = resizeAnimCurve;
  }

  // The current index of the selected item in the sidebar.
  late int _currentIndex;

  // Whether the sidebar is pinned.
  late bool _pinned;

  // The animation curve used for resizing the sidebar.
  late Curve _resizeAnimCurve;

  /// Gets the current index of the selected item.
  int get index => _currentIndex;

  /// Gets whether the sidebar is pinned.
  bool get pinned => _pinned;

  /// Gets the animation curve used for resizing the sidebar.
  Curve get resizeAnimCurve => _resizeAnimCurve;

  /// Sets the current index of the selected item.
  ///
  /// Parameters:
  /// - [index]: The new index to set.
  void setIndex(int index) {
    _currentIndex = index;
  }

  /// Sets whether the sidebar is pinned.
  ///
  /// Parameters:
  /// - [pinned]: The new pinned state to set.
  void setPinned(bool pinned) {
    _pinned = pinned;
  }

  /// Sets the animation curve used for resizing the sidebar.
  ///
  /// Parameters:
  /// - [animCurve]: The new animation curve to set.
  void setResizeAnimCurve(Curve animCurve) {
    _resizeAnimCurve = animCurve;
  }
}
