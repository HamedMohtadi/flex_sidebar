import 'package:flex_sidebar/flex_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlexSidebar unit tests/', () {
    test('set theme', () {
      final sidebar = FlexSidebar(
        items: [],
        primaryWidget: Placeholder(),
        secondaryWidget: Placeholder(),
        controller: FlexSidebarController(),
        theme: FlexThemeData(
          normalWidth: 400,
          minimizedWidth: 40,
          padding: EdgeInsetsDirectional.all(12),
          margin: EdgeInsetsDirectional.all(13),
          normalDecoration: BoxDecoration(color: Colors.amber),
          minimizedDecoration: BoxDecoration(color: Colors.blue),
          itemThemeData: FlexItemThemeData(iconSize: 41),
          itemsAlignment: MainAxisAlignment.end,
          footerDivider: Divider(
            color: Colors.cyan,
          ),
        ),
      );

      expect(sidebar.theme.normalWidth, 400);
      expect(sidebar.theme.minimizedWidth, 40);
      expect(sidebar.theme.padding, EdgeInsetsDirectional.all(12));
      expect(sidebar.theme.margin, EdgeInsetsDirectional.all(13));
      expect(
          sidebar.theme.normalDecoration, BoxDecoration(color: Colors.amber));
      expect(
          sidebar.theme.minimizedDecoration, BoxDecoration(color: Colors.blue));
      expect(sidebar.theme.itemThemeData.iconSize, 41);
      expect(sidebar.theme.itemsAlignment, MainAxisAlignment.end);
      expect(
        sidebar.theme.footerDivider.color,
        Colors.cyan,
      );
    });
  });
}
