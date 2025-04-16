import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flex_sidebar/flex_sidebar.dart';

main() {
  group('controller unit tests', () {
    test('setIndex', () {
      final controller = FlexSidebarController();
      controller.setIndex(10);
      expect(controller.index, 10);
      controller.setIndex(-1);
      expect(controller.index, -1);
    });

    test('setPinned', () {
      final controller = FlexSidebarController();
      controller.setPinned(true);
      expect(controller.pinned, true);
      controller.setPinned(false);
      expect(controller.pinned, false);
    });

    test('setResizeAnimCurve', () {
      final controller = FlexSidebarController();
      controller.setResizeAnimCurve(Curves.easeIn);
      expect(controller.resizeAnimCurve, Curves.easeIn);
      controller.setResizeAnimCurve(Curves.bounceIn);
      expect(controller.resizeAnimCurve, Curves.bounceIn);
    });
  });
}
