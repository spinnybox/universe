import 'package:flutter/material.dart';
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
  /// Typically the button's label.
  final Widget child;

  /// Called when the button is tapped
  final void Function() onPressed;

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  const WiredButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.width = 42.0,
    this.height,
  }) : super(key: key);

  @override
  Widget buildWiredElement() {
    return Container(
      padding: EdgeInsets.zero,
      height: height,
      width: width,
      decoration: const RoughBoxDecoration(
        shape: RoughBoxShape.rectangle,
        borderStyle: RoughDrawingStyle(
          width: 2,
          color: borderColor,
        ),
      ),
      child: SizedBox(
        height: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: textColor,
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
