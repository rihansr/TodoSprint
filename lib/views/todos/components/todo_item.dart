import 'package:flutter/material.dart';
import '../../../models/todo_model.dart';
import 'task_item.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo item) onSelected;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Hero(
      tag: todo.id,
      child: InkWell(
        onTap: () => onSelected.call(todo),
        child: Card(
          color: todo.theme?.color,
          shadowColor: todo.theme?.color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
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
              const Divider(indent: 16, height: 28),
              Expanded(
                flex: 3,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: todo.tasks.length,
                  itemBuilder: (context, i) {
                    final task = todo.tasks[i];
                    return TaskItem.small(key: ValueKey(i), task: task);
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
