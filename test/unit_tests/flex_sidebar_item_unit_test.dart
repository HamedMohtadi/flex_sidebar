import 'package:flex_sidebar/flex_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlexSidebarItem unit tests/', () {
    test('set theme', () {
      final flexSidebarItem = FlexSidebarItem(
        icon: Icon(Icons.import_contacts),
        label: Text("contacts"),
        itemThemeData: FlexItemThemeData(
            itemTextStyle: const TextStyle(fontSize: 35),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(1, 1, 1, 1),
            labelPadding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
            itemPadding: const EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
            hoverAnimColor: Colors.black12,
            itemColor: Colors.white10,
            selectedItemColor: Colors.pink,
            disabledItemColor: Colors.purple,
            iconSize: 40),
      );
      expect(flexSidebarItem.itemThemeData?.itemTextStyle,
          const TextStyle(fontSize: 35));
      expect(flexSidebarItem.itemThemeData?.iconPadding,
          const EdgeInsetsDirectional.fromSTEB(1, 1, 1, 1));
      expect(flexSidebarItem.itemThemeData?.labelPadding,
          const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2));
      expect(flexSidebarItem.itemThemeData?.itemPadding,
          const EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3));
      expect(flexSidebarItem.itemThemeData?.hoverAnimColor, Colors.black12);
      expect(flexSidebarItem.itemThemeData?.itemColor, Colors.white10);
      expect(flexSidebarItem.itemThemeData?.selectedItemColor, Colors.pink);
      expect(flexSidebarItem.itemThemeData?.disabledItemColor, Colors.purple);
      expect(flexSidebarItem.itemThemeData?.iconSize, 40);
    });

    test('override theme', () {
      final sidebar = FlexSidebar(
          items: [
            FlexSidebarItem(
              icon: Icon(Icons.abc),
              label: Text("abc"),
              itemThemeData: FlexItemThemeData(disabledItemColor: Colors.blue),
            )
          ],
          primaryWidget: Text("primaryWidget"),
          secondaryWidget: Text("secondaryWidget"),
          theme: FlexThemeData(
              itemThemeData: FlexItemThemeData(
                  hoverAnimColor: Colors.green,
                  disabledItemColor: Colors.amber)),
          controller: FlexSidebarController());

      expect(sidebar.items.first.itemThemeData?.disabledItemColor, Colors.blue);
      expect(sidebar.items.first.itemThemeData?.hoverAnimColor,
          FlexItemThemeData().hoverAnimColor);
    });

    test('color changed based onTap function', () {
      final item = FlexSidebarItem(icon: Icon(Icons.abc), label: Text("abc"));
      expect(item.icon.color, item.itemThemeData?.disabledItemColor);
      expect(item.label.style?.color, item.itemThemeData?.disabledItemColor);
      final item2 = FlexSidebarItem(
        icon: Icon(Icons.abc),
        label: Text("abc"),
        onTap: () => debugPrint("abc Tapped!"),
      );
      expect(item2.icon.color, item2.itemThemeData?.itemColor);
      expect(item2.label.style?.color, item2.itemThemeData?.disabledItemColor);
    });
  });
}
