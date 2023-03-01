import 'package:flutter/material.dart';
import '../rough/rough.dart';
import 'const.dart';

import 'canvas/wired_canvas.dart';
import 'wired_base.dart';

/// Wired progress
///
/// Usage:
/// ```dart
/// final _controller = AnimationController(
///    duration: const Duration(milliseconds: 1000), vsync: this);
/// ......
/// WiredProgress(controller: _controller, value: 0.5),
/// ......
/// _controller.forward();
/// _controller.stop();
/// _controller.reset();
/// ```
class WiredProgress extends StatefulWidget {
  const WiredProgress({
    Key? key,
    required this.controller,
    this.value = 0.0,
  }) : super(key: key);

  /// The current progress value, range is 0.0 ~ 1.0.
  final double value;

  final AnimationController controller;

  @override
  WiredProgressState createState() => WiredProgressState();
}

class WiredProgressState extends State<WiredProgress> with WiredRepaintMixin {
  final double _progressHeight = 20.0;
  double _width = 0.0;

  late Animation<double> _animation;
  late Tween<double> _tween;

  @override
  void initState() {
    super.initState();

    _tween = Tween<double>(begin: 0, end: 1);
    _animation = _tween.animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Curves.easeIn,
      ),
    )..addListener(() {
        setState(() {});
      });

    // Delay for calculate the width `_getWidth()` during the next frame
    Future.delayed(const Duration(milliseconds: 0), () {
      _tween.begin = widget.value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildWiredElement(child: _buildWidget());
  }

  Widget _buildWidget() {
    _width = _getWidth();

    return Stack(
      children: [
        SizedBox(
          height: _progressHeight,
          width: _width * _animation.value,
          child: WiredCanvas(
            painter: WiredRectangleBase(fillColor: borderColor),
            fillerType: RoughFilter.hachureFiller,
            fillerConfig: FillerConfig.build(hachureGap: 1.5),
          ),
        ),
        SizedBox(
          height: _progressHeight,
          width: _width,
          child: WiredCanvas(
            painter: WiredRectangleBase(),
            fillerType: RoughFilter.noFiller,
          ),
        ),
        LinearProgressIndicator(
          backgroundColor: Colors.transparent,
          minHeight: _progressHeight,
          color: Colors.transparent,
          value: _animation.value,
        ),
      ],
    );
  }

  double _getWidth() {
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
