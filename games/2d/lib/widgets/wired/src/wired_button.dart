import 'package:flutter/material.dart';
import 'package:spinnybox_2d/colors.dart';
import '../rough/rough.dart';

import 'const.dart';
import 'wired_base.dart';

/// Wired button.
///
/// Usage:
/// ```dart
/// WiredButton(
///  child: WiredText('Wired Button'),
///  onPressed: () {
///   print('Wired Button');
///  },
/// ),
/// ```
class WiredButton extends WiredBaseWidget {
  const WiredButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.width = 42.0,
    this.height,
    this.borderColor = AppColors.black,
    this.fillColor = AppColors.white,
    this.disabled = false,
  }) : super(key: key);

  const WiredButton.icon({
    Key? key,
    required this.onPressed,
    required Widget icon,
    double size = 40,
    this.borderColor = AppColors.black,
    this.fillColor = AppColors.white,
    this.disabled = false,
  })  : child = icon,
        width = size,
        height = size;

  /// Typically the button's label.
  final Widget child;

  /// Called when the button is tapped
  final void Function() onPressed;

  /// Whether the button is disabled.
  final bool disabled;

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  final Color? borderColor;
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
        fillStyle: RoughDrawingStyle(color: fillColor),
        borderStyle: RoughDrawingStyle(width: 2, color: borderColor),
      ),
      child: SizedBox(
        height: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: textColor,
            enableFeedback: !disabled,
          ),
          onPressed: disabled ? null : onPressed,
          child: child,
        ),
      ),
    );
  }
}
