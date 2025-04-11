import 'package:flutter/material.dart';

class SideGradientTransition extends AnimatedWidget {
  const SideGradientTransition(
      {super.key,
      required AnimationController animation,
      this.hoverAnimColor = Colors.white70,
      required Widget child})
      : _child = child,
        super(listenable: animation);

  final Widget _child;
  final Color hoverAnimColor;
  @override
  Widget build(BuildContext context) {
    AnimationController animation = listenable as AnimationController;
    final textDirection = Directionality.of(context);

    Alignment begin;
    Alignment end;

    if (textDirection == TextDirection.rtl) {
      begin = Alignment.centerLeft;
      end = Alignment.centerRight;
    } else {
      begin = Alignment.centerRight;
      end = Alignment.centerLeft;
    }

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: begin, end: end, stops: [
        0.0,
        animation.value
      ], colors: [
        hoverAnimColor,
        const Color.fromARGB(0, 255, 255, 255),
      ])),
      child: _child,
    );
  }
}
