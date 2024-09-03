import 'package:flutter/material.dart';
import '../../../models/todo_model.dart';
import 'task_item.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final int index;
  final Function(Todo item) onSelected;
  final Function(Todo item)? onAction;

  const TodoItem({
    super.key,
    required this.todo,
    required this.index,
    required this.onSelected,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Hero(
      tag: "${todo.id}_$index",
      child: Card(
        color: todo.theme.color,
        shadowColor: todo.theme.color,
        child: InkWell(
          onTap: () => onSelected.call(todo),
          onLongPress: () => onAction?.call(todo),
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    todo.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.25,
                    ),
                  ),
                ),
              ),
              const Expanded(flex: 1, child: Divider(indent: 16)),
              Expanded(
                flex: 6,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: todo.tasks.length,
                  itemBuilder: (context, i) {
                    final task = todo.tasks[i];
                    return TaskItem.small(
                      key: ValueKey(i),
                      todo: todo,
                      task: task,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
