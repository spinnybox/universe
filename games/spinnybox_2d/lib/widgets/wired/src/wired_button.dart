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
    this.borderWidth = 2,
    this.tooltip,
  }) : super(key: key);

  const WiredButton.icon({
    Key? key,
    required this.onPressed,
    required Widget icon,
    double size = 40,
    this.borderColor = AppColors.black,
    this.fillColor = AppColors.white,
    this.disabled = false,
    this.borderWidth = 2,
    this.tooltip,
  })  : child = icon,
        width = size,
        height = size,
        super(key: key);

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

  /// The color of the border.
  final Color? borderColor;

  /// The width of the border.
  final double? borderWidth;

  /// The color of the fill.
  final Color? fillColor;

  /// The tooltip of the button.
  final String? tooltip;

  @override
  Widget buildWiredElement() {
    final button = Container(
      padding: EdgeInsets.zero,
      height: height,
      width: width,
      decoration: RoughBoxDecoration(
        filler: SolidFiller(),
        shape: RoughBoxShape.rectangle,
        fillStyle: RoughDrawingStyle(color: fillColor, width: width),
        borderStyle: RoughDrawingStyle(width: borderWidth, color: borderColor),
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

    if (tooltip != null) {
      return Tooltip(
        message: tooltip,
        child: button,
      );
    }

    return button;
  }
}
