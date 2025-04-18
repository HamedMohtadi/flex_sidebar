import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_widget.dart';

main() {
  group('sidebar test/', () {
    testWidgets('pin behavior', (tester) async {
      await tester.pumpWidget(testFlexSideBar(false));

      final gesture = await tester.createGesture(
          kind: PointerDeviceKind.mouse); //create mouse gesture
      final pinButtonFinder = find.byType(MaterialButton); // pin/unpin button
      await gesture.addPointer(location: Offset.zero); //place mouse
      await gesture.moveTo(
          tester.getCenter(pinButtonFinder)); //move mouse to pin/unpin button
      await tester.pumpAndSettle(); // wait for rendering
      await tester.tap(pinButtonFinder);
      await tester.pump();
      expect(find.byType(Text), findsNWidgets(2));
    });
    testWidgets('unpin behavior', (tester) async {
      await tester.pumpWidget(testFlexSideBar(true));
      final pinButtonFinder = find.byType(MaterialButton); // pin/unpin button
      await tester.tap(pinButtonFinder); //unpin sidbar
      await tester.pump(); // render!
      final gesture = await tester.createGesture(
          kind: PointerDeviceKind.mouse); // create mouse pointer
      await gesture.addPointer(location: Offset.zero); //place mouse
      await gesture.moveTo(const Offset(500, 500)); // unhover from sidebar
      await tester.pumpAndSettle(); // wait for rendering
      expect(find.byType(Text),
          findsNothing); // now you should not see any text widget!
    });

    testWidgets("mouse hover/unhover when it's unpinned", (tester) async {
      await tester.pumpWidget(testFlexSideBar(false));
      final pinButtonFinder = find.byType(MaterialButton);
      final gesture = await tester.createGesture(
          kind: PointerDeviceKind.mouse); // create mouse pointer
      await gesture.addPointer(location: Offset.zero); //place mouse
      addTearDown(
          gesture.removePointer); //this is a type of dispose for mouse gesture!
      await tester.pump();
      await gesture
          .moveTo(tester.getCenter(pinButtonFinder)); // hover to sidebar
      await tester.pumpAndSettle(); // wait for rendering
      expect(find.byType(Text), findsNWidgets(2));
      await gesture.moveTo(const Offset(500, 500)); // unhover from sidebar
      await tester.pumpAndSettle(); // wait for rendering
      expect(find.byType(Text), findsNothing); // no text on unhover!
    });
  });
}
