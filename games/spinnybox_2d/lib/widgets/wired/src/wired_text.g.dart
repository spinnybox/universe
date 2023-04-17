// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wired_text.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class WiredText extends StatelessWidget {
  const WiredText(
    this.text, {
    Key? key,
    this.fontWeight = FontWeight.w500,
    this.fontSize = 18.0,
    this.letterSpacing = 2.0,
    this.color = AppColors.black,
    this.maxLines,
    this.textAlign,
  }) : super(key: key);

  final String text;

  final FontWeight? fontWeight;

  final double? fontSize;

  final double? letterSpacing;

  final Color? color;

  final int? maxLines;

  final TextAlign? textAlign;

  @override
  Widget build(BuildContext _context) => _wiredText(
        _context,
        text,
        fontWeight: fontWeight,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        color: color,
        maxLines: maxLines,
        textAlign: textAlign,
      );
}
