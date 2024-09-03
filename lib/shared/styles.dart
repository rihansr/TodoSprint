import 'dart:ui';

import 'package:flutter/material.dart';
import '../services/navigation_service.dart';
import 'colors.dart';
import 'enums.dart';
import 'strings.dart';

final style = Style.value;

class Style {
  static Style get value => Style._();
  Style._();

  final defaultBlur = ImageFilter.blur(sigmaX: 4, sigmaY: 4);

  SnackBar snackbar(
    String message, {
    AlertType? type,
    String? actionLabel,
    int duration = 3,
    Function()? onAction,
  }) =>
      SnackBar(
        backgroundColor: type?.backgroundColor,
        content: Text(
          message,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(navigator.context)
              .snackBarTheme
              .contentTextStyle!
              .copyWith(
                color: type?.textColor,
              ),
        ),
        action: (onAction != null)
            ? SnackBarAction(
                label: actionLabel ?? type?.actionLabel ?? string.okay,
                textColor: type?.textColor,
                onPressed: onAction,
              )
            : null,
        duration: Duration(seconds: duration),
      );
}

extension _MessageTypeExtensions on AlertType {
  String get actionLabel {
    switch (this) {
      case AlertType.error:
        return string.retry;
      default:
        return string.okay;
    }
  }

  Color? get backgroundColor => (() {
        final theme = Theme.of(navigator.context);
        switch (this) {
          case AlertType.error:
            return theme.colorScheme.error;
          case AlertType.info:
          default:
            return theme.colorScheme.primary;
        }
      }());

  Color? get textColor => (() {
        switch (this) {
          default:
            return ColorPalette.dark().headline;
        }
      }());
}
