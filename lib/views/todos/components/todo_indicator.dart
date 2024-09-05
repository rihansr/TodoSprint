import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../models/todo_model.dart';

class TodoIndicator extends StatelessWidget {
  final List<Todo> todos;
  final int currentIndex;
  final Function(int)? onSelected;

  const TodoIndicator({
    super.key,
    required this.todos,
    required this.currentIndex,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(40, 0, 16, 0),
        scrollDirection: Axis.horizontal,
        itemCount: todos.length,
        itemExtent: 16,
        itemBuilder: (context, i) {
          final todo = todos[i];
          return InkWell(
            onTap: onSelected != null
                ? () {
                    onSelected?.call(i);
                    HapticFeedback.lightImpact();
                  }
                : null,
            splashColor: Colors.transparent,
            child: Hero(
              tag: "${todo.id}_$currentIndex",
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 200),
                padding:
                    EdgeInsets.fromLTRB(5.5, i == currentIndex ? 0 : 8, 5.5, 0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: todo.theme.color,
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: const SizedBox.shrink(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
