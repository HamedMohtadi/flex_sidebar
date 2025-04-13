import 'package:flex_sidebar/src/flex_item_theme_data.dart';
import 'package:flutter/material.dart';
import 'side_gradient_transition.dart';
import 'extensions.dart';

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
  }) : _showAnimation = (onTap == null) ? false : hoverAnimationEnabled;

  final Icon icon;
  final Text label;
  final bool minimized;
  final Function? onTap;
  final bool isSelected;
  final bool hoverAnimationEnabled;
  final bool _showAnimation;
  final FlexItemThemeData? itemThemeData;

  @override
  State<FlexSidebarItem> createState() => _FlexSidebarItemState();
}

class _FlexSidebarItemState extends State<FlexSidebarItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemThemeData = widget.itemThemeData ?? FlexItemThemeData();
    return Padding(
      padding: itemThemeData.itemPadding,
      child: InkWell(
        onHover: (isHovered) => widget._showAnimation
            ? setState(() {
                isHovered ? _animation.animateTo(1) : _animation.animateTo(0);
              })
            : {},
        onTap: () => widget.onTap?.call(),
        child: SideGradientTransition(
          animation: _animation,
          hoverAnimColor: itemThemeData.hoverAnimColor,
          child: Row(
            mainAxisAlignment: widget.minimized
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              widget.icon.copyWith(
                color: widget.onTap == null
                    ? itemThemeData.disabledItemColor
                    : (widget.isSelected
                        ? itemThemeData.selectedItemColor
                        : itemThemeData.itemColor),
              ),
              widget.minimized
                  ? const SizedBox.shrink()
                  : Expanded(
                      child: Padding(
                      padding: itemThemeData.labelPadding,
                      child: Text(
                        widget.label.data ?? '',
                        style:
                            (widget.label.style ?? itemThemeData.itemTextStyle)
                                .copyWith(
                          color: widget.onTap == null
                              ? itemThemeData.disabledItemColor
                              : (widget.isSelected
                                  ? itemThemeData.selectedItemColor
                                  : itemThemeData.itemColor),
                        ),
                      ),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
