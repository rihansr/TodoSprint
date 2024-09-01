import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ColorPalette {
  Color primary;
  Color onPrimary;
  Color secondary;
  Color onSecondary;
  Color tertiary;
  Color onTertiary;
  Color surface;
  Color onSurface;
  Color scaffold;
  Color card;
  Color active;
  Color inactive;
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
    required this.tertiary,
    required this.onTertiary,
    required this.surface,
    required this.onSurface,
    required this.scaffold,
    required this.card,
    required this.active,
    required this.inactive,
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
        secondary: const Color(0xFFD4C4FC),
        onSecondary: const Color(0xFF000000),
        tertiary: const Color(0xFFF8ED91),
        onTertiary: const Color(0xFF000000),
        surface: const Color(0xFFFFFFFF),
        onSurface: const Color(0xFF000000),
        scaffold: const Color(0xFFFFFFFF),
        card: const Color(0xFFFFFFFF),
        active: const Color(0xFF12B76A),
        inactive: const Color(0xFFF79009),
        shadow: const Color(0x1A101828),
        icon: const Color(0xFF342E5E),
        headline: const Color(0xFF07003B),
        paragraph: const Color(0xFF342E5E),
        subtitle: const Color(0xFF797595),
        hint: const Color(0xFF797595),
        outline: const Color(0xFFC1BFCE),
        divider: const Color(0xFFEBEBEF),
        disable: const Color(0xFFEBEBEF),
        error: const Color(0xFFDC3545),
        onError: const Color(0xFFFFFFFF),
      );

  factory ColorPalette.dark() => ColorPalette(
        primary: const Color(0xFF4E53EE),
        onPrimary: const Color(0xFFFFFFFF),
        secondary: const Color(0xFFD4C4FC),
        onSecondary: const Color(0xFFFFFFFF),
        tertiary: const Color(0xFFFDF8D9),
        onTertiary: const Color(0xFFFFFFFF),
        surface: const Color(0xFF1D1E22),
        onSurface: const Color(0xFFFFFFFF),
        scaffold: const Color(0xFF000000),
        card: const Color(0xFF32363F),
        active: const Color(0xFF12B76A),
        inactive: const Color(0xFFF79009),
        shadow: const Color(0x1AFFFFFF),
        icon: const Color(0xFFFFFFFF),
        headline: const Color(0xFFFFFFFF),
        paragraph: const Color(0xFFFBFBFC),
        subtitle: const Color(0xFF606673),
        hint: const Color(0xFF606673),
        outline: const Color(0xFF797595),
        divider: const Color(0xFFFFFFFF),
        disable: const Color(0xFF26272C),
        error: const Color(0xFFDC3545),
        onError: const Color(0xFFFFFFFF),
      );
}
