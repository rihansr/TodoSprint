import 'package:flutter/material.dart';
import '../../../models/todo_model.dart';

class TodoIndicator extends StatelessWidget {
  final List<Todo> todos;
  final int currentIndex;

  const TodoIndicator({
    super.key,
    required this.todos,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(40, 12, 16, 12),
      separatorBuilder: (context, index) => const SizedBox(width: 12),
      scrollDirection: Axis.horizontal,
      itemCount: todos.length,
      itemBuilder: (context, i) {
        final todo = todos[i];
        return AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: i == currentIndex
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: SizedBox(
            key: const ValueKey(0),
            height: 25,
            child: Hero(
              tag: "${todo.id}_$currentIndex",
              child: DecoratedBox(
                decoration: BoxDecoration(color: todo.theme?.color),
                child: const SizedBox(height: 25, width: 5),
              ),
            ),
          ),
          secondChild: SizedBox(
            key: const ValueKey(1),
            height: 25,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: DecoratedBox(
                decoration: BoxDecoration(color: todo.theme?.color),
                child: const SizedBox(height: 15, width: 5),
              ),
            ),
          ),
        );
      },
    );
  }
}
