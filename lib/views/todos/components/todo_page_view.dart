import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../models/todo_model.dart';
import '../../../shared/strings.dart';
import '../../../viewmodels/todo_viewmodel.dart';
import 'task_item.dart';

class TodoPage extends StatelessWidget {
  final Todo todo;
  const TodoPage({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider<TodoViewModel>.value(
      value: TodoViewModel(todo),
      child: Consumer<TodoViewModel>(
          builder: (context, controller, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(40, 0, 16, 0),
                    leading: Align(
                      alignment: Alignment.topCenter,
                      widthFactor: 1,
                      child: Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.only(top: 2),
                        child: CircularProgressIndicator(
                          value: todo.progress,
                          strokeWidth: 2,
                          color: todo.theme?.color,
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                    ),
                    horizontalTitleGap: 0,
                    title: Text(todo.title),
                    titleTextStyle: theme.textTheme.headlineMedium,
                    subtitle: Text(
                      string.tasksCount(todo.completionCount, todo.count),
                      style: const TextStyle(height: 2),
                    ),
                  ),
                  const Divider(indent: 80, height: 40),
                  Expanded(
                    child: AnimatedList(
                      key: controller.listKey,
                      initialItemCount: todo.tasks.length,
                      itemBuilder: (context, i, animation) {
                        final task = todo.tasks[i];
                        return Dismissible(
                          key: ValueKey(i),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) => controller.removeTask(i),
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child:
                                const Icon(Iconsax.trash, color: Colors.white),
                          ),
                          child: SizeTransition(
                            sizeFactor: animation,
                            child: TaskItem(
                              todo: todo,
                              task: task,
                              onSelected: (item) =>
                                  controller.updateTask(item, i),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )),
    );
  }
}
