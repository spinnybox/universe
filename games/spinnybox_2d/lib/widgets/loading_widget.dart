import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:spinnybox_2d/assets.dart';

part 'loading_widget.g.dart';

/// Eventually this will be a progress loading widget.
/// TODO set this up to load properly
@hwidget
Widget _loading(
  BuildContext context, {
  void Function()? onDismount,
}) {
  useEffect(() => onDismount, const []);

  return SvgPicture.asset(
    UiAsset.loading,
    width: MediaQuery.of(context).size.width - 80,
    semanticsLabel: 'Loading',
  );
}
