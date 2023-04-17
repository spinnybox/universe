import 'package:flutter/painting.dart' show Color;

class AppColor extends Color {
  const AppColor(int value, this._hues) : super(value);
  static final Map<int, Color> _cache = {};

  final Map<int, int> _hues;

  /// Get the color of the hue. It falls back to the default hue if the value provided doesn't
  /// exist.
  ///
  /// Hues can be the following int values.
  /// - `900`
  /// - `800`
  /// - `700`
  /// - `600`
  /// - `500`
  /// - `400`
  /// - `300`
  /// - `200`
  /// - `100`
  /// - `50`
  Color hue(int value) {
    final hue = _hues[value];

    if (hue == null) {
      return this;
    }

    return _cache[hue] ??= Color(hue);
  }
}

class AppColors {
  /// Magenta
  ///
  /// The default hue is `500`.
  static const primary = AppColor(0xFFFD0A5B, {
    900: 0xFF9E004F,
    800: 0xFFC20053,
    700: 0xFFD60056,
    600: 0xFFEC0259,
    400: 0xFFff3a74,
    300: 0xFFff618d,
    200: 0xFFff8fae,
    100: 0xFFffbcce,
    50: 0xFFffe4eb,
  });

  /// Yellow
  ///
  /// The default hue is `700`.
  static const secondary = AppColor(0xFFFFBE33, {
    900: 0xFFF77D22,
    800: 0xFFFCA62D,
    600: 0xFFFFD63A,
    500: 0xFFFFE439,
    400: 0xFFFFEA57,
    300: 0xFFFFEF77,
    200: 0xFFFFF49D,
    100: 0xFFFFF8C4,
    50: 0xFFFFFDE7,
  });

  /// Blue
  ///
  /// The default hue is `500`.
  static const tertiary = AppColor(0xFF0099FF, {
    900: 0xFF0248AC,
    800: 0xFF0467CB,
    700: 0xFF0478DD,
    600: 0xFF048BF1,
    400: 0xFF38A8FF,
    300: 0xFF5FB8FF,
    200: 0xFF8ECCFF,
    100: 0xFFBBDFFF,
    50: 0xFFE3F3FE,
  });

  /// Purple
  ///
  /// The default hue is `500`.
  static const alternative = AppColor(0xFFB309DE, {
    900: 0xFF4806C3,
    800: 0xFF7609CB,
    700: 0xFF8B0AD1,
    600: 0xFFA20CD8,
    400: 0xFFC041E4,
    300: 0xFFCC68EA,
    200: 0xFFDB95F0,
    100: 0xFFE9C0F5,
    50: 0xFFF7E6FB,
  });

  /// White
  static const white = Color(0xFFFFFFFF);

  /// Grey
  static const grey = Color(0xFFC6C6C6);

  /// Black
  static const black = Color(0xFF000000);

  /// Invisible.
  static const Color transparent = Color(0x00000000);
}
