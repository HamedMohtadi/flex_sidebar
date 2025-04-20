import 'package:flutter/material.dart';

/// A widget that applies a gradient transition effect to its child.
/// This is typically used to create a hover animation effect.
class SideGradientTransition extends AnimatedWidget {
  /// Creates a `SideGradientTransition` widget.
  ///
  /// Parameters:
  /// - [animation]: The animation controller that drives the gradient transition.
  /// - [hoverAnimColor]: The color used for the hover animation gradient.
  /// - [child]: The widget to which the gradient transition is applied.
  const SideGradientTransition({
    super.key,
    required AnimationController animation,
    this.hoverAnimColor = Colors.white70,
    required Widget child,
  })  : _child = child,
        super(listenable: animation);

  /// The child widget to which the gradient transition is applied.
  final Widget _child;

  /// The color used for the hover animation gradient.
  final Color hoverAnimColor;

  @override
  Widget build(BuildContext context) {
    // Cast the listenable to an AnimationController.
    AnimationController animation = listenable as AnimationController;

    // Retrieve the current text direction (LTR or RTL) from the context.
    final textDirection = Directionality.of(context);

    // Define the start and end alignment for the gradient based on text direction.
    Alignment begin;
    Alignment end;

    if (textDirection == TextDirection.rtl) {
      // For right-to-left text direction, the gradient starts from the left.
      begin = Alignment.centerLeft;
      end = Alignment.centerRight;
    } else {
      // For left-to-right text direction, the gradient starts from the right.
      begin = Alignment.centerRight;
      end = Alignment.centerLeft;
    }

    return Container(
      // Apply a gradient decoration to the container.
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          stops: [
            0.0,
            animation
                .value, // The animation value determines the gradient's progress.
          ],
          colors: [
            hoverAnimColor, // The hover animation color.
            const Color.fromARGB(0, 255, 255, 255), // Transparent color.
          ],
        ),
      ),
      // Render the child widget inside the container.
      child: _child,
    );
  }
}
