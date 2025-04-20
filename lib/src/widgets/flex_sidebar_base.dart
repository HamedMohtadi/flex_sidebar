// Import necessary packages and dependencies.
import 'package:flex_sidebar/src/controller/flex_sidebar_controller.dart';
import 'package:flex_sidebar/src/themes/flex_theme_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flex_sidebar/src/widgets/flex_sidebar_item.dart';
import 'package:collection/collection.dart';

/// A customizable sidebar widget with support for theming, animations,
/// and hierarchical items.
class FlexSidebar extends StatefulWidget {
  const FlexSidebar({
    super.key,
    required this.items,
    required this.primaryWidget,
    required this.secondaryWidget,
    required this.controller,
    this.theme = const FlexThemeData(),
  });

  /// Controller to manage the state of the sidebar (e.g., pinned, index).
  final FlexSidebarController controller;

  /// List of sidebar items to display.
  final List<FlexSidebarItem> items;

  /// Widget displayed at the top of the sidebar.
  final Widget primaryWidget;

  /// Widget displayed below the primary widget when the sidebar is expanded.
  final Widget secondaryWidget;

  /// Theme data for customizing the appearance of the sidebar.
  final FlexThemeData theme;

  @override
  State<FlexSidebar> createState() => _FlexSidebarState();
}

class _FlexSidebarState extends State<FlexSidebar> {
  // Indicates whether the sidebar is minimized.
  late bool _minimized;

  // Indicates whether the sidebar is pinned.
  late bool _pinned;

  // Tracks the selected item and subitem indices.
  late Map<int, int> _currentIndex;

  @override
  void initState() {
    super.initState();
    // Initialize the pinned and minimized states based on the controller.
    _pinned = widget.controller.pinned;
    _minimized = !widget.controller.pinned;

    // Initialize the current index with the controller's index.
    _currentIndex = {widget.controller.index: -1};
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      // Animate size changes with a smooth transition.
      duration: const Duration(milliseconds: 500),
      curve: widget.controller.resizeAnimCurve,
      child: SizedBox(
        // Adjust the width of the sidebar based on its state (minimized or expanded).
        width:
            _minimized ? widget.theme.minimizedWidth : widget.theme.normalWidth,
        child: MouseRegion(
          // Handles mouse hover events to toggle the minimized state.
          onEnter: (_) => _pinned
              ? {}
              : setState(() {
                  _minimized = false;
                }),
          onExit: (_) => _pinned
              ? {}
              : setState(() {
                  _minimized = true;
                }),
          child: Container(
            // Applies the appropriate decoration based on the sidebar state.
            decoration: _minimized
                ? widget.theme.minimizedDecoration
                : widget.theme.normalDecoration,
            padding: widget.theme.padding,
            margin: widget.theme.margin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top section containing primary and secondary widgets.
                Column(
                  children: [
                    widget.primaryWidget,
                    _minimized
                        ? const SizedBox.shrink()
                        : Center(
                            child: widget.secondaryWidget,
                          ),
                  ],
                ),
                // Middle section containing the list of items.
                Expanded(
                  child: widget.theme.scrollableItems
                      // If scrollableItems is true, wrap the items list in a scrollable widget.
                      ? SingleChildScrollView(child: _itemsListWidget())
                      // Otherwise, display the items list directly.
                      : _itemsListWidget(),
                ),
                // Bottom section containing the footer and pin button.
                Column(
                  children: [
                    // Divider widget to separate the footer from the rest of the sidebar.
                    widget.theme.footerDivider,
                    // Conditionally render the pin button based on the platform.
                    ((defaultTargetPlatform == TargetPlatform.android) ||
                            (defaultTargetPlatform == TargetPlatform.iOS))
                        // On mobile platforms, the pin button is hidden.
                        ? const SizedBox.shrink()
                        : MaterialButton(
                            // Toggles the pinned state of the sidebar when pressed.
                            onPressed: () {
                              setState(() {
                                _pinned = !_pinned;
                              });
                            },
                            // If the sidebar is minimized, hide the button.
                            child: _minimized
                                ? const SizedBox.shrink()
                                // Otherwise, display the pin/unpin icon based on the pinned state.
                                : Center(
                                    child: Icon(
                                      _pinned
                                          ? Icons
                                              .push_pin // Icon for pinned state.
                                          : Icons
                                              .push_pin_outlined, // Icon for unpinned state.
                                    ),
                                  ),
                          ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the list of sidebar items and their subitems.
  Widget _itemsListWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: widget.theme.itemsAlignment,
      children: [
        // Map each item to a FlexSidebarItem widget.
        ...widget.items.mapIndexed(
          (i, e) => FlexSidebarItem(
            icon: e.icon,
            label: e.label,
            onTap: e.onTap == null
                ? null
                : () {
                    setState(() {
                      // Update the current index when an item is tapped.
                      widget.controller.setIndex(i);
                      _currentIndex = {i: -1};
                    });
                    e.onTap?.call();
                  },
            isSelected: _currentIndex.keys.contains(i),
            minimized: _minimized,
            hoverAnimationEnabled: e.hoverAnimationEnabled,
            itemThemeData: e.itemThemeData ?? widget.theme.itemThemeData,
            subitems: e.subitems
                .mapIndexed(
                  (j, el) => FlexSidebarItem(
                    icon: el.icon,
                    label: el.label,
                    onTap: el.onTap == null
                        ? null
                        : () {
                            setState(() {
                              // Update the current index when a subitem is tapped.
                              widget.controller.setIndex(i);
                              _currentIndex = {i: j};
                            });
                            el.onTap?.call();
                          },
                    isSelected: _currentIndex[i] == j,
                    minimized: _minimized,
                    hoverAnimationEnabled: el.hoverAnimationEnabled,
                    itemThemeData:
                        el.itemThemeData ?? widget.theme.itemThemeData,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
