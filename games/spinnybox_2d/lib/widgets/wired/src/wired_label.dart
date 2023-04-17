import 'package:flutter/material.dart';
import 'package:spinnybox_2d/colors.dart';
import '../rough/rough.dart';

import 'wired_base.dart';

/// Wired button.
///
/// Usage:
/// ```dart
/// WiredLabel(
///  child: WiredText('Wired Button'),
///  onPressed: () {
///   print('Wired Button');
///  },
/// ),
/// ```
class WiredLabel extends WiredBaseWidget {
  const WiredLabel({
    Key? key,
    required this.child,
    this.width = 42.0,
    this.height,
    this.borderColor = AppColors.black,
    this.fillColor = AppColors.white,
    this.borderWidth = 2,
  }) : super(key: key);

  /// Typically the button's label.
  final Widget child;

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  /// The color of the border.
  final Color? borderColor;

  /// The width of the border.
  final double? borderWidth;

  /// The color of the fill.
  final Color? fillColor;

  @override
  Widget buildWiredElement() {
    return Container(
      padding: EdgeInsets.zero,
      height: height,
      width: width,
      decoration: RoughBoxDecoration(
        filler: SolidFiller(),
        shape: RoughBoxShape.rectangle,
        fillStyle: RoughDrawingStyle(width: width, color: fillColor),
        borderStyle: RoughDrawingStyle(width: borderWidth, color: borderColor),
      ),
      child: SizedBox(height: double.infinity, child: child),
    );
  }
}
