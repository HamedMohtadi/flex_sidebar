import 'package:flex_sidebar/src/flex_item_theme_data.dart';
import 'package:flutter/material.dart';

class FlexThemeData {
  const FlexThemeData(
      {this.normalWidth = 300,
      this.minimizedWidth = 60,
      this.padding = const EdgeInsetsDirectional.all(0),
      this.margin = const EdgeInsetsDirectional.all(0),
      this.itemThemeData = const FlexItemThemeData(),
      this.itemsAlignment = MainAxisAlignment.end,
      this.footerDivider = const Divider(
        indent: 5,
        endIndent: 5,
        color: Colors.black12,
      ),
      this.normalDecoration = const BoxDecoration(
          borderRadius:
              BorderRadiusDirectional.horizontal(end: Radius.circular(40)),
          color: Color.fromARGB(255, 171, 228, 255)),
      this.minimizedDecoration = const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Color.fromARGB(255, 119, 212, 255))});
  final double normalWidth;
  final double minimizedWidth;
  final EdgeInsetsDirectional? padding;
  final EdgeInsetsDirectional? margin;
  final BoxDecoration normalDecoration;
  final BoxDecoration minimizedDecoration;
  final FlexItemThemeData itemThemeData;
  final MainAxisAlignment itemsAlignment;
  final Divider footerDivider;
}
