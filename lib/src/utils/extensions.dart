import 'package:flutter/material.dart';

/// An extension on the `Icon` widget to provide a `copyWith` method.
/// This allows creating a new `Icon` instance with modified properties
/// while keeping the rest of the properties unchanged.
extension IconCopyWith on Icon {
  /// Creates a copy of the current `Icon` with updated properties.
  ///
  /// Parameters:
  /// - [icon]: The new `IconData` to use for the icon.
  /// - [key]: The new `Key` for the icon.
  /// - [size]: The new size of the icon.
  /// - [fill]: The new fill level of the icon.
  /// - [weight]: The new weight of the icon.
  /// - [grade]: The new grade of the icon.
  /// - [opticalSize]: The new optical size of the icon.
  /// - [color]: The new color of the icon.
  /// - [shadows]: The new list of shadows to apply to the icon.
  /// - [semanticLabel]: The new semantic label for accessibility.
  /// - [textDirection]: The new text direction for the icon.
  /// - [applyTextScaling]: Whether to apply text scaling to the icon.
  /// - [blendMode]: The new blend mode to apply to the icon.
  ///
  /// Returns:
  /// A new `Icon` instance with the updated properties.
  Icon copyWith({
    IconData? icon,
    Key? key,
    double? size,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    Color? color,
    List<Shadow>? shadows,
    String? semanticLabel,
    TextDirection? textDirection,
    bool? applyTextScaling,
    BlendMode? blendMode,
  }) {
    // Return a new Icon instance with the updated properties.
    return Icon(
      icon ??
          this.icon, // Use the new icon if provided, otherwise keep the current one.
      key: key ??
          this.key, // Use the new key if provided, otherwise keep the current one.
      size: size ??
          this.size, // Use the new size if provided, otherwise keep the current one.
      weight: weight ??
          this.weight, // Use the new weight if provided, otherwise keep the current one.
      grade: grade ??
          this.grade, // Use the new grade if provided, otherwise keep the current one.
      opticalSize: opticalSize ??
          this.opticalSize, // Use the new optical size if provided, otherwise keep the current one.
      color: color ??
          this.color, // Use the new color if provided, otherwise keep the current one.
      shadows: shadows ??
          this.shadows, // Use the new shadows if provided, otherwise keep the current ones.
      semanticLabel: semanticLabel ??
          this.semanticLabel, // Use the new semantic label if provided, otherwise keep the current one.
      textDirection: textDirection ??
          this.textDirection, // Use the new text direction if provided, otherwise keep the current one.
      applyTextScaling: applyTextScaling ??
          this.applyTextScaling, // Use the new scaling option if provided, otherwise keep the current one.
      blendMode: blendMode ??
          this.blendMode, // Use the new blend mode if provided, otherwise keep the current one.
    );
  }
}
