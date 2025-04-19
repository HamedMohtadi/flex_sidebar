import 'dart:io';
import 'package:flex_sidebar/src/controller/flex_sidebar_controller.dart';
import 'package:flex_sidebar/src/themes/flex_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flex_sidebar/src/widgets/flex_sidebar_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class FlexSidebar extends StatefulWidget {
  const FlexSidebar({
    super.key,
    required this.items,
    required this.primaryWidget,
    required this.secondaryWidget,
    required this.controller,
    this.theme = const FlexThemeData(),
  });

  final FlexSidebarController controller;
  final List<FlexSidebarItem> items;
  final Widget primaryWidget;
  final Widget secondaryWidget;
  final FlexThemeData theme;

  @override
  State<FlexSidebar> createState() => _FlexSidebarState();
}

class _FlexSidebarState extends State<FlexSidebar> {
  late bool _minimized;
  late bool _pinned;
  late Map<int, int> _currentIndex;
  @override
  void initState() {
    super.initState();
    _pinned = widget.controller.pinned;
    _minimized = !widget.controller.pinned;
    _currentIndex = {widget.controller.index: -1};
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      curve: widget.controller.resizeAnimCurve,
      child: SizedBox(
        width:
            _minimized ? widget.theme.minimizedWidth : widget.theme.normalWidth,
        child: MouseRegion(
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
            decoration: _minimized
                ? widget.theme.minimizedDecoration
                : widget.theme.normalDecoration,
            padding: widget.theme.padding,
            margin: widget.theme.margin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Expanded(
                  child: widget.theme.scrollableItems
                      ? SingleChildScrollView(child: _itemsListWidget())
                      : _itemsListWidget(),
                ),
                Column(
                  children: [
                    widget.theme.footerDivider,
                    (!kIsWeb && (Platform.isAndroid || Platform.isIOS))
                        ? const SizedBox.shrink()
                        : MaterialButton(
                            onPressed: () {
                              setState(() {
                                _pinned = !_pinned;
                              });
                            },
                            child: _minimized
                                ? const SizedBox.shrink()
                                : Center(
                                    child: Icon(
                                      _pinned
                                          ? Icons.push_pin
                                          : Icons.push_pin_outlined,
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

  Widget _itemsListWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: widget.theme.itemsAlignment,
      children: [
        ...widget.items.mapIndexed(
          (i, e) => FlexSidebarItem(
            icon: e.icon,
            label: e.label,
            onTap: e.onTap == null
                ? null
                : () {
                    setState(() {
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
