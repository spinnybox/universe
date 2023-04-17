import 'package:flutter/material.dart';
import '../../rough/rough.dart';

import 'wired_painter_base.dart';
import 'wired_painter.dart';

class WiredCanvas extends StatelessWidget {
  const WiredCanvas({
    Key? key,
    required this.painter,
    required this.fillerType,
    this.drawConfig,
    this.fillerConfig,
    this.size,
  }) : super(key: key);
  final WiredPainterBase painter;
  final DrawConfig? drawConfig;
  final FillerConfig? fillerConfig;
  final RoughFilter fillerType;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    DrawConfig drawConfig = this.drawConfig ?? DrawConfig.defaultValues;
    FillerConfig fillerConfig = this.fillerConfig ?? FillerConfig.defaultConfig;

    Filler filler = _filters[fillerType]!.call(fillerConfig);
    return CustomPaint(
      size: size == null ? const Size.square(double.infinity) : size!,
      painter: WiredPainter(drawConfig, filler, painter),
    );
  }
}

Map<RoughFilter, Filler Function(FillerConfig)> _filters =
    <RoughFilter, Filler Function(FillerConfig)>{
  RoughFilter.noFiller: (fillerConfig) => NoFiller(fillerConfig),
  RoughFilter.hachureFiller: (fillerConfig) => HachureFiller(fillerConfig),
  RoughFilter.zigZagFiller: (fillerConfig) => ZigZagFiller(fillerConfig),
  RoughFilter.hatchFiller: (fillerConfig) => HatchFiller(fillerConfig),
  RoughFilter.dotFiller: (fillerConfig) => DotFiller(fillerConfig),
  RoughFilter.dashedFiller: (fillerConfig) => DashedFiller(fillerConfig),
  RoughFilter.solidFiller: (fillerConfig) => SolidFiller(fillerConfig),
};

enum RoughFilter {
  noFiller,
  hachureFiller,
  zigZagFiller,
  hatchFiller,
  dotFiller,
  dashedFiller,
  solidFiller,
}
