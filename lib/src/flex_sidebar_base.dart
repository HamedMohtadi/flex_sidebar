import 'dart:io';
import 'package:flex_sidebar/src/flex_sidebar_controller.dart';
import 'package:flex_sidebar/src/flex_theme.dart';
import 'package:flutter/material.dart';
import 'flex_sidebar_item.dart';
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
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pinned = widget.controller.pinned;
    _minimized = !widget.controller.pinned;
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
                Column(
                  children: [
                    ...widget.items.mapIndexed((i, e) => FlexSidebarItem(
                          icon: e.icon,
                          label: e.label,
                          onTap: e.onTap == null
                              ? null
                              : () {
                                  setState(() {
                                    _currentIndex = i;
                                  });
                                  e.onTap?.call();
                                },
                          isSelected: (i ==
                                  (widget.controller.currentIndex ??
                                      _currentIndex))
                              ? true
                              : false,
                          minimized: _minimized,
                          hoverAnimationEnabled: e.hoverAnimationEnabled,
                          itemThemeData: e.itemThemeData,
                        )),
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
}
