import 'package:flex_sidebar/src/themes/flex_item_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flex_sidebar/src/utils/side_gradient_transition.dart';
import 'package:flex_sidebar/src/utils/extensions.dart';

/// A widget representing an individual item in the FlexSidebar.
/// It supports animations, theming, and hierarchical subitems.
class FlexSidebarItem extends StatefulWidget {
  const FlexSidebarItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.isSelected = false,
    this.minimized = false,
    this.itemThemeData,
    this.hoverAnimationEnabled = true,
    this.subitems = const [],
  }) : _showAnimation = (onTap == null) ? false : hoverAnimationEnabled;

  /// The icon displayed for the sidebar item.
  final Icon icon;

  /// The label displayed next to the icon.
  final Text label;

  /// Whether the sidebar is in a minimized state.
  final bool minimized;

  /// Callback function triggered when the item is tapped.
  final Function? onTap;

  /// Whether the item is currently selected.
  final bool isSelected;

  /// Whether hover animations are enabled for the item.
  final bool hoverAnimationEnabled;

  /// Internal flag to determine if hover animations should be shown.
  final bool _showAnimation;

  /// Theme data for customizing the appearance of the item.
  final FlexItemThemeData? itemThemeData;

  /// List of subitems nested under this item.
  final List<FlexSidebarItem> subitems;

  @override
  State<FlexSidebarItem> createState() => _FlexSidebarItemState();
}

class _FlexSidebarItemState extends State<FlexSidebarItem>
    with SingleTickerProviderStateMixin {
  // Animation controller for managing hover animations.
  late final AnimationController _animation;

  // Tracks whether the subitems are expanded.
  bool _extended = false;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller with a short duration.
    _animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
  }

  @override
  void dispose() {
    // Dispose of the animation controller to free resources.
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the theme data for the item, or use default values.
    final itemThemeData = widget.itemThemeData ?? FlexItemThemeData();

    return Padding(
      // Apply padding around the item.
      padding: itemThemeData.itemPadding,
      child: Column(
        children: [
          // Main clickable area of the item.
          InkWell(
            // Handle hover events to trigger animations.
            onHover: (isHovered) => widget._showAnimation
                ? setState(() {
                    isHovered
                        ? _animation.animateTo(1)
                        : _animation.animateTo(0);
                  })
                : {},
            // Handle tap events to trigger the onTap callback or toggle subitems.
            onTap: widget.subitems.isEmpty
                ? () => widget.onTap?.call()
                : () => setState(() {
                      _extended = !_extended;
                    }),
            child: SideGradientTransition(
              // Apply a gradient transition effect during hover animations.
              animation: _animation,
              hoverAnimColor: itemThemeData.hoverAnimColor,
              child: Row(
                mainAxisAlignment: widget.minimized
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  // Display the item's icon with appropriate size and color.
                  widget.icon.copyWith(
                    size: widget.icon.size ?? widget.itemThemeData?.iconSize,
                    color: widget.icon.color ??
                        (widget.onTap == null
                            ? itemThemeData.disabledItemColor
                            : (widget.isSelected
                                ? itemThemeData.selectedItemColor
                                : itemThemeData.itemColor)),
                  ),
                  // Display the item's label if the sidebar is not minimized.
                  widget.minimized
                      ? const SizedBox.shrink()
                      : Expanded(
                          child: Padding(
                          padding: itemThemeData.labelPadding,
                          child: Text(
                            widget.label.data ?? '',
                            style: (widget.label.style ??
                                    itemThemeData.itemTextStyle)
                                .copyWith(
                              color: widget.onTap == null
                                  ? itemThemeData.disabledItemColor
                                  : (widget.isSelected
                                      ? itemThemeData.selectedItemColor
                                      : itemThemeData.itemColor),
                            ),
                          ),
                        )),
                  // Display a toggle button for subitems if they exist.
                  widget.minimized
                      ? const SizedBox.shrink()
                      : widget.subitems.isNotEmpty
                          ? IconButton(
                              onPressed: () => setState(() {
                                    _extended = !_extended;
                                  }),
                              icon: Icon(
                                _extended
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: itemThemeData
                                    .itemColor, // set extend Icon in nested items mode to itemColor
                              ))
                          : SizedBox.shrink()
                ],
              ),
            ),
          ),
          // Display subitems if the item is expanded and not minimized.
          if (_extended && !widget.minimized) ...widget.subitems
        ],
      ),
    );
  }
}
