import 'package:flutter/material.dart';
import 'package:todo_sprint/shared/utils.dart';
import '../../../models/task_model.dart';
import '../../../models/todo_model.dart';

class TaskItem extends StatelessWidget {
  final Todo todo;
  final Task task;
  final Function(Task item)? onSelected;
  final bool _isSmaller;

  const TaskItem({
    super.key,
    required this.todo,
    required this.task,
    this.onSelected,
  }) : _isSmaller = false;

  const TaskItem.small({
    super.key,
    required this.todo,
    required this.task,
  })  : onSelected = null,
        _isSmaller = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;

    return _isSmaller
        ? ListTile(
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            dense: true,
            minLeadingWidth: 0,
            leading: Transform.scale(
              scale: 0.75,
              child: Checkbox(
                value: task.isCompleted,
                onChanged: (_) => {},
                activeColor: Colors.white,
                checkColor: theme.textTheme.labelSmall?.color,
                side: const BorderSide(color: Colors.white),
              ),
            ),
            horizontalTitleGap: 8,
            title: Text(
              task.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                color: task.isCompleted
                    ? Colors.white.withOpacity(0.75)
                    : Colors.white,
                fontWeight: FontWeight.w500,
                decoration: textDecoration,
              ),
            ),
          )
        : ListTile(
            contentPadding: const EdgeInsets.fromLTRB(32, 0, 16, 0),
            onTap: () => onSelected?.call(
              task.copyWith(isCompleted: !task.isCompleted),
            ),
            leading: Align(
              alignment: Alignment.topLeft,
              widthFactor: 0,
              child: Transform.scale(
                scale: 0.95,
                child: Checkbox(
                  value: task.isCompleted,
                  activeColor: todo.theme?.color,
                  onChanged: (_) => {},
                ),
              ),
            ),
            minLeadingWidth: 48,
            horizontalTitleGap: 0,
            title: Text(
              task.name,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: task.isCompleted ? todo.theme?.color : null,
                fontWeight: FontWeight.w500,
                decoration: textDecoration,
              ),
            ),
            subtitle: task.timestamp != null
                ? Text(
                    task.timestamp?.EEEMMMd ?? '',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 2,
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  )
                : null,
          );
  }
}
