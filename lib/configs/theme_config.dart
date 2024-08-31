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
    dialogBackgroundColor: colorPalette.scaffold,
    canvasColor: colorPalette.background,
    primaryColor: colorPalette.primary,
    dividerColor: colorPalette.divider,
    brightness: mode == ThemeMode.light ? Brightness.light : Brightness.dark,
    focusColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
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
      color: colorPalette.scaffold,
      shadowColor: colorPalette.shadow,
      foregroundColor: colorPalette.icon,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: colorPalette.icon, size: 24),
      actionsIconTheme: IconThemeData(color: colorPalette.subtitle, size: 24),
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1,
        letterSpacing: 0.15,
        color: colorPalette.headline,
      ),
    ),
    tabBarTheme: const TabBarTheme().copyWith(
      labelColor: Colors.white,
      unselectedLabelColor: colorPalette.primary,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    listTileTheme: const ListTileThemeData().copyWith(
      iconColor: colorPalette.icon,
      minLeadingWidth: 0,
      titleTextStyle: TextStyle(
        fontSize: 15,
        height: 1.5,
        fontWeight: FontWeight.w400,
        color: colorPalette.headline,
      ),
      subtitleTextStyle: TextStyle(
        fontSize: 14,
        height: 1.5,
        fontWeight: FontWeight.w400,
        color: colorPalette.subtitle,
      ),
    ),
    expansionTileTheme: const ExpansionTileThemeData().copyWith(
      backgroundColor: colorPalette.card,
      collapsedBackgroundColor: colorPalette.card,
      textColor: colorPalette.headline,
      collapsedTextColor: colorPalette.headline,
      iconColor: colorPalette.headline,
      collapsedIconColor: colorPalette.headline,
      shape: const RoundedRectangleBorder(),
      collapsedShape: const RoundedRectangleBorder(),
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      color: colorPalette.card,
      surfaceTintColor: Colors.transparent,
      shadowColor: colorPalette.shadow,
      elevation: 8,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    snackBarTheme: const SnackBarThemeData().copyWith(
      backgroundColor: colorPalette.background,
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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorPalette.background,
      elevation: 4,
      selectedIconTheme: IconThemeData(color: colorPalette.primary, size: 24),
      unselectedIconTheme: IconThemeData(color: colorPalette.icon, size: 24),
      unselectedItemColor: colorPalette.paragraph,
      selectedItemColor: colorPalette.primary,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        height: 1.33,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        height: 1.33,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        height: 1.29,
        color: colorPalette.headline,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        height: 1.33,
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
        height: 1.43,
        color: colorPalette.subtitle,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 13,
        height: 1.5,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        height: 1.33,
        color: colorPalette.subtitle,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        height: 1.4,
        color: colorPalette.subtitle,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.5,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.43,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        height: 1.33,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: colorPalette.scaffold,
      selectedColor: colorPalette.primary,
      padding: const EdgeInsets.all(6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: colorPalette.outline),
      ),
      labelStyle: TextStyle(
        fontSize: 14,
        color: colorPalette.subtitle,
        fontWeight: FontWeight.w400,
      ),
      secondaryLabelStyle: const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: colorPalette.divider,
      thickness: 1,
    ),
    bottomSheetTheme: const BottomSheetThemeData().copyWith(
      modalBackgroundColor: colorPalette.scaffold,
      modalBarrierColor: Colors.black26,
      clipBehavior: Clip.antiAlias,
      shadowColor: colorPalette.shadow,
      surfaceTintColor: Colors.transparent,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: colorPalette.background,
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
        (Set<WidgetState> states) => TextStyle(
          fontSize: 12,
          height: 1.33,
          fontWeight: FontWeight.w500,
          color: colorPalette.paragraph,
        ),
      ),
      elevation: 1,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
