import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1D3153);
  static const Color blue = Color(0xFF2A4779);
  static const Color lightBlue = Color(0xFF375E9F);
  static const Color darkGray = Color(0xFF9B9696);
  static const Color lightGray = Color(0xFFE6E6E6);
  static const Color orange = Color(0xFFFFB446);

  static MaterialColor getMaterialColorFromColor(Color color) {
    final Map<int, Color> colorShades = {
      50: _getShade(color, value: 0.5),
      100: _getShade(color, value: 0.4),
      200: _getShade(color, value: 0.3),
      300: _getShade(color, value: 0.2),
      400: _getShade(color, value: 0.1),
      500: color, //Primary value
      600: _getShade(color, value: 0.1, darker: true),
      700: _getShade(color, value: 0.15, darker: true),
      800: _getShade(color, value: 0.2, darker: true),
      900: _getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }

  static Color _getShade(Color color,
      {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
        (darker ? (hsl.lightness - value) : (hsl.lightness + value))
            .clamp(0.0, 1.0));

    return hslDark.toColor();
  }
}
