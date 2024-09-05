import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../models/task_model.dart';
import '../../../models/todo_model.dart';
import '../../../shared/utils.dart';

class TaskItem extends StatelessWidget {
  final Todo todo;
  final Task task;
  final Function(Task item)? onChecked;
  final Function(Task item)? onSelected;
  final bool _isSmaller;

  const TaskItem({
    super.key,
    required this.todo,
    required this.task,
    this.onChecked,
    this.onSelected,
  }) : _isSmaller = false;

  const TaskItem.small({
    super.key,
    required this.todo,
    required this.task,
  })  : onChecked = null,
        onSelected = null,
        _isSmaller = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;

    return _isSmaller
        ? ListTile(
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            contentPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
            dense: true,
            minLeadingWidth: 0,
            leading: Transform.scale(
              scale: 0.7,
              child: Checkbox(
                value: task.isCompleted,
                onChanged: (_) => {},
                activeColor: Colors.white,
                checkColor: todo.theme.color,
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
            splashColor: todo.theme.color?.withOpacity(0.2),
            onTap: () {
              onChecked?.call(
                task.copyWith(isCompleted: !task.isCompleted),
              );
              HapticFeedback.lightImpact();
            },
            onLongPress: () => onSelected?.call(task),
            leading: AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: task.timestamp != null
                  ? Alignment.topLeft
                  : Alignment.centerLeft,
              widthFactor: 0,
              child: Transform.scale(
                scale: 0.85,
                child: Checkbox(
                  value: task.isCompleted,
                  activeColor: todo.theme.color,
                  onChanged: (_) => {},
                ),
              ),
            ),
            minLeadingWidth: 48,
            horizontalTitleGap: 0,
            title: Text(
              task.name,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: task.isCompleted ? todo.theme.color : null,
                fontWeight: FontWeight.w500,
                decoration: textDecoration,
              ),
            ),
            subtitle: task.timestamp != null
                ? Text(
                    task.timestamp?.time ?? '',
                    style: theme.textTheme.bodySmall?.copyWith(height: 2.25,),
                  )
                : null,
          );
  }
}
