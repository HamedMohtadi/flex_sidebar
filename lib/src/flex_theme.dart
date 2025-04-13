import 'package:flex_sidebar/src/flex_item_theme_data.dart';
import 'package:flutter/material.dart';

class FlexThemeData {
  const FlexThemeData(
      {this.normalWidth = 300,
      this.minimizedWidth = 60,
      this.padding = const EdgeInsets.all(10),
      this.margin = const EdgeInsets.all(5),
      this.itemThemeData = const FlexItemThemeData(),
      this.normalDecoration = const BoxDecoration(
          borderRadius:
              BorderRadiusDirectional.horizontal(end: Radius.circular(40)),
          color: Color.fromARGB(255, 171, 228, 255)),
      this.minimizedDecoration = const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Color.fromARGB(255, 119, 212, 255))});
  final double normalWidth;
  final double minimizedWidth;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxDecoration normalDecoration;
  final BoxDecoration minimizedDecoration;
  final FlexItemThemeData itemThemeData;
}
