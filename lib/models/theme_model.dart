import 'dart:ui';
import '../shared/utils.dart';

class TodoTheme {
  final Color? color;

  const TodoTheme({
    this.color,
  });

  TodoTheme copyWith({
    Color? color,
  }) {
    return TodoTheme(
      color: color ?? this.color,
    );
  }

  factory TodoTheme.fromMap(Map<String, dynamic> map) {
    return TodoTheme(
      color:
          map['color'] != null ? HexColorExtension(map['color']).color : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'color': color?.hex,
    };
  }
}
