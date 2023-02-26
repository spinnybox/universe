import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:spinnybox_2d/colors.dart';
import 'package:spinnybox_2d/constants.dart';

part 'wired_text.g.dart';

@swidget
Widget _wiredText(
  BuildContext context,
  String text, {
  FontWeight? fontWeight = FontWeight.w500,
  double? fontSize = 18.0,
  double? letterSpacing = 2.0,
  Color? color = AppColors.black,
  int? maxLines,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    maxLines: maxLines,
    textAlign: textAlign,
    style: TextStyle(
      decoration: TextDecoration.none,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
      letterSpacing: letterSpacing,
    ),
  );
}
