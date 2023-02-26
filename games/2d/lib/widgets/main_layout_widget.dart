import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:spinnybox_2d/assets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'svg_background_widget.dart';

part 'main_layout_widget.g.dart';

@swidget
Widget _mainLayout(
  BuildContext context, {
  /// The child widget to be displayed in the main layout.
  required Widget child,
  Widget? background = const SvgBackground(SvgAsset.backgroundDefault),
}) {
  return Stack(
    children: <Widget>[
      if (background != null) ...[
        background,
      ],
      Container(
        alignment: Alignment.center,
        child: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: child,
          ),
        ),
      ),
    ],
  );
}
