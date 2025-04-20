import 'package:flutter/material.dart';

/// A class that defines the theme data for individual items in the FlexSidebar.
/// This includes styling, padding, colors, and other visual properties.
class FlexItemThemeData {
  /// Creates a `FlexItemThemeData` instance with default or custom values.
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

  /// The text style for the item's label.
  final TextStyle itemTextStyle;

  /// Padding around the item's icon.
  final EdgeInsetsDirectional iconPadding;

  /// Padding around the item's label.
  final EdgeInsetsDirectional labelPadding;

  /// Padding around the entire item.
  final EdgeInsetsDirectional itemPadding;

  /// The color used for hover animations.
  final Color hoverAnimColor;

  /// The default color of the item.
  final Color itemColor;

  /// The color of the item when it is selected.
  final Color selectedItemColor;

  /// The color of the item when it is disabled.
  final Color disabledItemColor;

  /// The size of the item's icon.
  final double? iconSize;

  /// Creates a copy of the current `FlexItemThemeData` with updated properties.
  ///
  /// Parameters:
  /// - [itemTextStyle]: The new text style for the item's label.
  /// - [iconPadding]: The new padding around the item's icon.
  /// - [labelPadding]: The new padding around the item's label.
  /// - [itemPadding]: The new padding around the entire item.
  /// - [hoverAnimColor]: The new color for hover animations.
  /// - [itemColor]: The new default color of the item.
  /// - [selectedItemColor]: The new color of the item when selected.
  /// - [disabledItemColor]: The new color of the item when disabled.
  ///
  /// Returns:
  /// A new `FlexItemThemeData` instance with the updated properties.
  FlexItemThemeData copyWith({
    TextStyle? itemTextStyle,
    EdgeInsetsDirectional? iconPadding,
    EdgeInsetsDirectional? labelPadding,
    EdgeInsetsDirectional? itemPadding,
    Color? hoverAnimColor,
    Color? itemColor,
    Color? selectedItemColor,
    Color? disabledItemColor,
  }) {
    return FlexItemThemeData(
      // Use the new value if provided, otherwise keep the current value.
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
