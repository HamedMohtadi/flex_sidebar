import 'package:flutter/material.dart';
import 'sidebar_item.dart';
import 'package:collection/collection.dart';

class FlexSidebar extends StatefulWidget {
  const FlexSidebar(
      {super.key,
      required this.items,
      required this.primaryWidget,
      required this.secondaryWidget,
      this.pinned = true,
      this.currentIndex,
      this.maxWidth = 300,
      this.minWidth = 60,
      this.resizeAnimCurve = Curves.easeOutCirc,
      this.normalDecoration = const BoxDecoration(
          borderRadius:
              BorderRadiusDirectional.horizontal(end: Radius.circular(40)),
          color: Color.fromARGB(255, 171, 228, 255)),
      this.minimizedDecoration = const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Color.fromARGB(255, 119, 212, 255))});

  final List<SidebarItem> items;
  final Widget primaryWidget;
  final Widget secondaryWidget;
  final bool pinned;
  final double maxWidth;
  final double minWidth;
  final BoxDecoration normalDecoration;
  final BoxDecoration minimizedDecoration;
  final int? currentIndex;
  final Curve resizeAnimCurve;

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
    _pinned = widget.pinned;
    _minimized = !widget.pinned;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      curve: widget.resizeAnimCurve,
      child: SizedBox(
        width: _minimized ? widget.minWidth : widget.maxWidth,
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: _minimized ? 10 : 0),
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
                  ? widget.minimizedDecoration
                  : widget.normalDecoration,
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
                      ...widget.items.mapIndexed((i, e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: SidebarItem(
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
                              isSelected:
                                  (i == (widget.currentIndex ?? _currentIndex))
                                      ? true
                                      : false,
                              minimized: _minimized,
                              hoverAnimationEnabled: e.hoverAnimationEnabled,
                              hoverAnimColor: e.hoverAnimColor,
                            ),
                          )),
                      MaterialButton(
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
                                ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
