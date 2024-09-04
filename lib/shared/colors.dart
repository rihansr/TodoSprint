import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ColorPalette {
  Color primary;
  Color onPrimary;
  Color secondary;
  Color onSecondary;
  Color highlight;
  Color surface;
  Color onSurface;
  Color scaffold;
  Color card;
  Color shadow;
  Color icon;
  Color headline;
  Color paragraph;
  Color subtitle;
  Color hint;
  Color outline;
  Color divider;
  Color disable;
  Color error;
  Color onError;

  ColorPalette({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.highlight,
    required this.surface,
    required this.onSurface,
    required this.scaffold,
    required this.card,
    required this.shadow,
    required this.icon,
    required this.headline,
    required this.paragraph,
    required this.subtitle,
    required this.hint,
    required this.outline,
    required this.divider,
    required this.disable,
    required this.error,
    required this.onError,
  });

  factory ColorPalette.light() => ColorPalette(
        primary: const Color(0xFF4E53EE),
        onPrimary: const Color(0xFFFFFFFF),
        secondary: const Color(0xFFE91E63),
        onSecondary: const Color(0xFFFFFFFF),
        surface: const Color(0xFFF7F7F7),
        onSurface: const Color(0xFF303030),
        highlight: const Color(0xFFFFFFFF),
        scaffold: const Color(0xFFF2F4F5),
        card: const Color(0xFFFFFFFF),
        shadow: const Color(0x1A000000),
        icon: const Color(0xFF342E5E),
        headline: const Color(0xFF212121),
        paragraph: const Color(0xFF424242),
        subtitle: const Color(0xFF757575),
        hint: const Color(0xFFB0BEC5),
        outline: const Color(0xFFB0BEC5),
        divider: const Color(0xFFEBEBEF),
        disable: const Color(0xFFCFD8DC),
        error: const Color(0xFFD50000),
        onError: const Color(0xFFFFFFFF),
      );

  factory ColorPalette.dark() => ColorPalette(
        primary: const Color(0xFF4E53EE),
        onPrimary: const Color(0xFFFFFFFF),
        secondary: const Color(0xFFE91E63),
        onSecondary: const Color(0xFFFFFFFF),
        surface: const Color(0xFF000000),
        onSurface: const Color(0xFFB3B3B3),
        highlight: const Color(0xFF1A1A1A),
        scaffold: const Color(0xFF0A0A0A),
        card: const Color(0xFF1A1A1A),
        shadow: const Color(0x60000000),
        icon: const Color(0xFFB0BEC5),
        headline: const Color(0xFFB0BEC5),
        paragraph: const Color(0xFF9E9E9E),
        subtitle: const Color(0xFF757575),
        hint: const Color(0xFF616161),
        outline: const Color(0xFF424242),
        divider: const Color(0xFF333333),
        disable: const Color(0xFF1C1C1C),
        error: const Color(0xFFCF6679),
        onError: const Color(0xFFFFFFFF),
      );
}
