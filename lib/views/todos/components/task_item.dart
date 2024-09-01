import 'package:flutter/material.dart';
import '../../../models/task_model.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(Task item)? onSelected;
  final bool _isSmaller;

  const TaskItem({
    super.key,
    required this.task,
    required this.onSelected,
  }) : _isSmaller = false;

  const TaskItem.small({
    super.key,
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
            contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            dense: true,
            minLeadingWidth: 0,
            leading: Transform.scale(
              scale: 0.75,
              child: Checkbox(
                value: task.isCompleted,
                onChanged: (selected) => onSelected?.call(
                  task.copyWith(isCompleted: selected ?? false),
                ),
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
        : CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: task.isCompleted,
            onChanged: (selected) => onSelected?.call(
              task.copyWith(isCompleted: selected ?? false),
            ),
            title: Text(
              task.name,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: task.isCompleted ? theme.colorScheme.error : null,
                fontWeight: FontWeight.w500,
                decoration: textDecoration,
              ),
            ),
          );
  }
}
