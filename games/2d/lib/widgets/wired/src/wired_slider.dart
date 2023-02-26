import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../rough/rough.dart';
import 'const.dart';

import 'canvas/wired_canvas.dart';
import 'wired_base.dart';

/// Wired slider.
///
/// ```
/// Container(
/// 	padding: EdgeInsets.all(25.0),
/// 	height: 200.0,
/// 	child: WiredSlider(
/// 	  value: _currentSliderValue,
/// 	  min: 0,
/// 	  max: 100,
/// 	  divisions: 5,
/// 	  label: _currentSliderValue.round().toString(),
/// 	  onChanged: (double value) {
/// 		setState(() {
/// 		  _currentSliderValue = value;
/// 		});
/// 		print('$_currentSliderValue');
/// 		return true;
/// 	  },
/// 	),
///   ),
/// ```
class WiredSlider extends HookWidget {
  const WiredSlider({
    Key? key,
    required this.value,
    this.divisions,
    this.label,
    this.min = 0.0,
    this.max = 1.0,
    required this.onChanged,
  }) : super(key: key);

  /// The currently selected value for this slider.
  ///
  /// The slider's thumb is drawn at a position that corresponds to this value.
  final double value;

  /// The number of discrete divisions.
  ///
  /// Typically used with [label] to show the current discrete value.
  ///
  /// If null, the slider is continuous.
  final int? divisions;

  /// A label to show above the slider when the slider is active.
  final String? label;

  /// The minimum value the user can select.
  ///
  /// Defaults to 0.0. Must be less than or equal to [max].
  ///
  /// If the [max] is equal to the [min], then the slider is disabled.
  final double min;

  /// The maximum value the user can select.
  ///
  /// Defaults to 1.0. Must be greater than or equal to [min].
  ///
  /// If the [max] is equal to the [min], then the slider is disabled.
  final double max;

  /// Called during a drag when the user is selecting a new value for the slider
  /// by dragging.
  final bool Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    final forcedRerender = useState(0);
    final currentValue = useState(value);
    final onChangedCallback = useCallback((double value) {
      bool result = false;
      if (onChanged != null) {
        result = onChanged!(value);
      }

      if (result) {
        currentValue.value = value;
      }
    }, [onChanged]);

    useEffect(() {
      // Delay for calculate the slider's width `_getSliderWidth()` during the next frame
      Future.delayed(const Duration(milliseconds: 0), () {
        forcedRerender.value = 1;
      });

      return null;
    }, const []);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 1,
          width: double.infinity,
          child: WiredCanvas(
            painter: WiredLineBase(
              x1: 0,
              y1: 0,
              x2: double.infinity,
              y2: 0,
              strokeWidth: 2,
            ),
            fillerType: RoughFilter.HatchFiller,
          ),
        ),
        Positioned(
          left: _getWidth(context) * currentValue.value / max - 12,
          child: SizedBox(
            height: 24.0,
            width: 24.0,
            child: WiredCanvas(
              painter: WiredCircleBase(
                diameterRatio: .7,
                fillColor: textColor,
              ),
              fillerType: RoughFilter.HachureFiller,
              fillerConfig: FillerConfig.build(hachureGap: 1.0),
            ),
          ),
        ),
        SliderTheme(
          data: SliderThemeData(
            trackShape: CustomTrackShape(),
          ),
          child: Slider(
            value: currentValue.value,
            min: min,
            max: max,
            activeColor: Colors.transparent,
            inactiveColor: Colors.transparent,
            divisions: divisions,
            label: label,
            onChanged: onChangedCallback,
          ),
        ),
      ],
    );
  }

  double _getWidth(BuildContext context) {
    double width = 0;

    try {
      var box = context.findRenderObject() as RenderBox;
      width = box.size.width;
    } catch (e) {
      // ignore
    }

    return width;
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
