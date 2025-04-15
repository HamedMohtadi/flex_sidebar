import 'package:flutter/material.dart';

class FlexItemThemeData {
  const FlexItemThemeData({
    this.itemTextStyle = const TextStyle(fontSize: 20),
    this.iconPadding = const EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
    this.labelPadding = const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
    this.itemPadding = const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
    this.hoverAnimColor = Colors.white70,
    this.itemColor = Colors.black45,
    this.selectedItemColor = Colors.black,
    this.disabledItemColor = Colors.black12,
    this.iconSize = 30,
  });

  final EdgeInsetsDirectional iconPadding;
  final EdgeInsetsDirectional labelPadding;
  final EdgeInsetsDirectional itemPadding;
  final Color hoverAnimColor;
  final Color itemColor;
  final Color selectedItemColor;
  final Color disabledItemColor;
  final TextStyle itemTextStyle;
  final double? iconSize;

  FlexItemThemeData copyWith(
      {TextStyle? itemTextStyle,
      EdgeInsetsDirectional? iconPadding,
      EdgeInsetsDirectional? labelPadding,
      EdgeInsetsDirectional? itemPadding,
      Color? hoverAnimColor,
      Color? itemColor,
      Color? selectedItemColor,
      Color? disabledItemColor}) {
    return FlexItemThemeData(
      itemTextStyle: itemTextStyle ?? this.itemTextStyle,
      iconPadding: iconPadding ?? this.iconPadding,
      labelPadding: labelPadding ?? this.labelPadding,
      itemPadding: itemPadding ?? this.itemPadding,
      hoverAnimColor: hoverAnimColor ?? this.hoverAnimColor,
      itemColor: itemColor ?? this.itemColor,
      selectedItemColor: selectedItemColor ?? this.selectedItemColor,
      disabledItemColor: disabledItemColor ?? this.disabledItemColor,
    );
  }
}
