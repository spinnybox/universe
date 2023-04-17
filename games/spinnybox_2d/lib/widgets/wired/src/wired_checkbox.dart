import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../rough/rough.dart';

import 'const.dart';
import 'wired_base.dart';

/// Wired checkbox.
///
/// Usage:
/// ```dart
/// WiredCheckbox(
///   value: false,
///   onChanged: (value) {
/// 	print('Wired Checkbox $value');
///   },
/// ),
/// ```
class WiredCheckbox extends HookWidget with WiredRepaintMixin {
  const WiredCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  /// Determines the checkbox checked or not.
  final bool? value;

  /// Called once the checkbox check status changes.
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    final checked = useState(value ?? false);

    final child = Container(
      padding: EdgeInsets.zero,
      height: 27.0,
      width: 27.0,
      decoration: const RoughBoxDecoration(
        shape: RoughBoxShape.rectangle,
        borderStyle: RoughDrawingStyle(
          width: 1,
          color: borderColor,
        ),
      ),
      child: SizedBox(
        height: double.infinity,
        child: Transform.scale(
          // Checkbox default size is 18.0, so 18.0 * 1.5 = 27 for the outer Container's width & height
          scale: 1.5,
          child: Checkbox(
            fillColor: MaterialStateProperty.all(Colors.transparent),
            checkColor: borderColor,
            onChanged: (value) {
              onChanged(value);
              checked.value = value ?? false;
            },
            value: checked.value,
          ),
        ),
      ),
    );

    return buildWiredElement(
      key: key,
      child: child,
    );
  }
}
