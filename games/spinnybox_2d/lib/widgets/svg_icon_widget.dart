import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spinnybox_2d/colors.dart';

/// Transforms the svg asset into a full screen sized image.
class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.assetName, {
    super.key,
    this.size = 40,
    this.color = AppColors.black,
    this.label = '',
  });

  final String assetName;
  final double size;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      semanticsLabel: label,
    );
  }
}
