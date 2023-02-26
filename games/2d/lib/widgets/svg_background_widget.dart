import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Transforms the svg asset into a full screen sized image.
class SvgBackground extends StatelessWidget {
  const SvgBackground(this.assetName);

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
      alignment: Alignment.bottomCenter,
    );
  }
}
