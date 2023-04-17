import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../rough/rough.dart';
import 'wired_base.dart';

import 'canvas/wired_canvas.dart';

/// Wired combo
///
/// Usage:
/// ```dart
/// WiredCombo(
///   value: 'One',
///   items: ['One', 'Two', 'Free', 'Four']
/// 	  .map<DropdownMenuItem<String>>((dynamic value) {
/// 	return DropdownMenuItem<String>(
/// 	  value: value,
/// 	  child: Padding(
/// 		padding: EdgeInsets.only(left: 5.0),
/// 		child: WiredText(value),
/// 	  ),
/// 	);
///   }).toList(),
///   onChanged: (value) {
/// 	print('$value');
///   },
/// ),
/// ```
class WiredCombo extends HookWidget {
  const WiredCombo({
    Key? key,
    required this.items,
    this.value,
    this.onChanged,
    this.height = 60.0,
  }) : super(key: key);

  /// The selected value for combo.
  final dynamic value;

  /// The selection items for combo.
  final List<DropdownMenuItem<dynamic>> items;

  /// Called when the combo selected value changed.
  final void Function(dynamic)? onChanged;

  final double height;

  @override
  Widget build(BuildContext context) {
    final state = useState(value);

    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      height: height,
      child: Stack(
        children: [
          Positioned(
            right: 10.0,
            top: 20.0,
            child: WiredCanvas(
              painter: WiredInvertedTriangleBase(),
              fillerType: RoughFilter.hachureFiller,
              fillerConfig: FillerConfig.build(hachureGap: 2),
              size: const Size(18.0, 18.0),
            ),
          ),
          SizedBox(
            height: height,
            width: double.infinity,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                itemHeight: height,
                isExpanded: true,
                elevation: 0,
                icon: const Visibility(
                  visible: false,
                  child: Icon(Icons.arrow_downward),
                ),
                value: state.value,
                items: items.map((item) {
                  return DropdownMenuItem<dynamic>(
                    value: item.value,
                    child: Stack(
                      children: [
                        WiredCanvas(
                          painter: WiredRectangleBase(),
                          fillerType: RoughFilter.noFiller,
                          size: Size(double.infinity, height),
                        ),
                        Positioned(
                          top: 20.0,
                          child: item.child,
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (dynamic value) {
                  state.value = value;
                  onChanged?.call(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
