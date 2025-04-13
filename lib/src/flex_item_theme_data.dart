import 'package:flutter/material.dart';

class FlexItemThemeData {
  const FlexItemThemeData({
    this.itemTextStyle = const TextStyle(),
    this.iconPadding = const EdgeInsets.all(0),
    this.labelPadding = const EdgeInsets.all(0),
    this.itemPadding = const EdgeInsets.all(5),
    this.hoverAnimColor = Colors.white70,
    this.itemColor = Colors.black45,
    this.selectedItemColor = Colors.black,
    this.disabledItemColor = Colors.black12,
  });

  final TextStyle itemTextStyle;
  final EdgeInsets iconPadding;
  final EdgeInsets labelPadding;
  final EdgeInsets itemPadding;
  final Color hoverAnimColor;
  final Color itemColor;
  final Color selectedItemColor;
  final Color disabledItemColor;
}
