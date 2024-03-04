import 'package:flutter/material.dart';

class XigoRichTag {
  /// Options for customize the tags
  ///
  /// Example:
  /// ```dart
  /// XigoRichTag(
  ///   tag: 'zona de tránsito',
  ///   style: XigoText.style(
  ///     fontWeight: FontWeight.bold,
  ///   ),
  /// )
  /// ```
  XigoRichTag({
    required this.tag,
    required this.style,
    this.onTap,
  });

  /// Name of words that you want to change the style.
  String tag;

  /// Style for the tag.
  final TextStyle style;

  /// onTap function when the words is pressed.
  final void Function()? onTap;
}

///rich Text widget - fontSize 14
