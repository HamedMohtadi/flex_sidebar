import 'package:flex_sidebar/src/themes/flex_item_theme_data.dart';
import 'package:flutter/material.dart';

/// A class that defines the theme data for the FlexSidebar widget.
/// This includes dimensions, decorations, alignment, and other visual properties.
class FlexThemeData {
  /// Creates a `FlexThemeData` instance with default or custom values.
  const FlexThemeData({
    this.normalWidth = 300, // Default width of the sidebar when expanded.
    this.minimizedWidth = 60, // Default width of the sidebar when minimized.
    this.padding =
        const EdgeInsetsDirectional.all(0), // Padding around the sidebar.
    this.margin =
        const EdgeInsetsDirectional.all(0), // Margin around the sidebar.
    this.itemThemeData =
        const FlexItemThemeData(), // Theme data for individual items.
    this.itemsAlignment =
        MainAxisAlignment.end, // Alignment of items in the sidebar.
    this.scrollableItems = false, // Whether the items are scrollable.
    this.footerDivider = const Divider(
      indent: 5, // Indentation for the divider.
      endIndent: 5, // End indentation for the divider.
      color: Colors.black12, // Color of the divider.
    ),
    this.normalDecoration = const BoxDecoration(
      // Decoration for the sidebar when expanded.
      borderRadius: BorderRadiusDirectional.horizontal(
        end: Radius.circular(40), // Rounded corners on the right side.
      ),
      color: Color.fromARGB(255, 171, 228, 255), // Background color.
    ),
    this.minimizedDecoration = const BoxDecoration(
      // Decoration for the sidebar when minimized.
      borderRadius: BorderRadius.all(
        Radius.circular(40), // Fully rounded corners.
      ),
      color: Color.fromARGB(255, 119, 212, 255), // Background color.
    ),
  });

  /// The width of the sidebar when it is in its normal (expanded) state.
  final double normalWidth;

  /// The width of the sidebar when it is in its minimized state.
  final double minimizedWidth;

  /// The padding around the sidebar.
  final EdgeInsetsDirectional? padding;

  /// The margin around the sidebar.
  final EdgeInsetsDirectional? margin;

  /// The decoration applied to the sidebar when it is in its normal (expanded) state.
  final BoxDecoration normalDecoration;

  /// The decoration applied to the sidebar when it is in its minimized state.
  final BoxDecoration minimizedDecoration;

  /// The theme data for individual items in the sidebar.
  final FlexItemThemeData itemThemeData;

  /// The alignment of items within the sidebar.
  final MainAxisAlignment itemsAlignment;

  /// The divider widget displayed at the footer of the sidebar.
  final Divider footerDivider;

  /// Whether the items in the sidebar are scrollable.
  final bool scrollableItems;
}
