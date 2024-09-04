import 'package:flutter/material.dart';
import '../shared/colors.dart';

ThemeData theming(ThemeMode mode) {
  ColorPalette colorPalette;
  switch (mode) {
    case ThemeMode.light:
      colorPalette = ColorPalette.light();
      break;
    case ThemeMode.dark:
    default:
      colorPalette = ColorPalette.dark();
  }

  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: false,
    colorScheme: ColorScheme(
      brightness: mode == ThemeMode.light ? Brightness.light : Brightness.dark,
      primary: colorPalette.primary,
      onPrimary: colorPalette.onPrimary,
      secondary: colorPalette.secondary,
      onSecondary: colorPalette.onSecondary,
      surface: colorPalette.surface,
      onSurface: colorPalette.onSurface,
      error: colorPalette.error,
      onError: colorPalette.error,
      shadow: colorPalette.shadow,
      outline: colorPalette.outline,
      surfaceTint: Colors.transparent,
    ),
    highlightColor: colorPalette.highlight,
    dialogBackgroundColor: colorPalette.scaffold,
    canvasColor: colorPalette.surface,
    primaryColor: colorPalette.primary,
    dividerColor: colorPalette.divider,
    brightness: mode == ThemeMode.light ? Brightness.light : Brightness.dark,
    shadowColor: colorPalette.shadow,
    scaffoldBackgroundColor: colorPalette.scaffold,
    cardColor: colorPalette.card,
    hintColor: colorPalette.hint,
    disabledColor: colorPalette.disable,
    iconTheme: IconThemeData(
      color: colorPalette.icon,
      size: 24,
    ),
    appBarTheme: const AppBarTheme().copyWith(
      toolbarHeight: 128,
      color: colorPalette.scaffold,
      shadowColor: colorPalette.shadow,
      foregroundColor: colorPalette.icon,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: colorPalette.icon),
      actionsIconTheme: IconThemeData(color: colorPalette.icon),
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: colorPalette.headline,
      ),
    ),
    checkboxTheme: const CheckboxThemeData().copyWith(
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      side: BorderSide(color: colorPalette.outline),
      fillColor: WidgetStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return colorPalette.primary;
          }
          return Colors.transparent;
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    cardTheme: const CardTheme().copyWith(
      clipBehavior: Clip.antiAlias,
      color: colorPalette.card,
      surfaceTintColor: Colors.transparent,
      shadowColor: colorPalette.shadow,
      elevation: 2.5,
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: const ButtonStyle().copyWith(
        overlayColor: const WidgetStatePropertyAll<Color>(
          Colors.transparent,
        ),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 15,
            height: 1,
            color: colorPalette.primary,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ),
    dividerTheme: const DividerThemeData().copyWith(
      color: colorPalette.divider,
      space: 0,
      thickness: 1,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData().copyWith(
      circularTrackColor: colorPalette.disable,
    ),
    snackBarTheme: const SnackBarThemeData().copyWith(
      backgroundColor: colorPalette.surface,
      contentTextStyle: TextStyle(
        fontSize: 14,
        height: 1.43,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),
      elevation: 2,
      actionTextColor: colorPalette.paragraph,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorPalette.scaffold,
      elevation: 0,
      selectedIconTheme: IconThemeData(color: colorPalette.paragraph),
      unselectedIconTheme: IconThemeData(color: colorPalette.subtitle),
      unselectedItemColor: colorPalette.subtitle,
      selectedItemColor: colorPalette.headline,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),
    textTheme: const TextTheme().copyWith(
      headlineLarge: TextStyle(
        fontSize: 28,
        height: 1,
        color: colorPalette.headline,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        height: 1,
        color: colorPalette.headline,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        height: 1,
        color: colorPalette.headline,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        height: 1,
        color: colorPalette.headline,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        height: 1,
        color: colorPalette.headline,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        height: 1,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        height: 1,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        height: 1,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        height: 1,
        color: colorPalette.subtitle,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        height: 1,
        color: colorPalette.subtitle,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
