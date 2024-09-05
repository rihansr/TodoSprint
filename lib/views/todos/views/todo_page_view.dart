import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../models/todo_model.dart';
import '../../../shared/functions.dart';
import '../../../shared/strings.dart';
import '../../../viewmodels/todo_viewmodel.dart';
import '../../tabs/views/add_todo_view.dart';
import '../components/task_item.dart';
import 'add_task_view.dart';

class TodoPage extends StatelessWidget {
  final Todo todo;
  final Function(Todo todo) onUpdate;
  final Function(Todo todo) onRemove;
  final TaskListener listener;

  const TodoPage({
    super.key,
    required this.todo,
    required this.onUpdate,
    required this.onRemove,
    required this.listener,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider<TodoViewModel>.value(
      value: TodoViewModel(
        context: context,
        todo: todo,
        onUpdate: onUpdate,
        onRemove: onRemove,
        listener: listener,
      ),
      child: Consumer<TodoViewModel>(
        builder: (context, controller, _) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(40, 0, 8, 0),
              leading: Align(
                alignment: Alignment.bottomCenter,
                widthFactor: 1,
                heightFactor: .7,
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    value: controller.todo.progress,
                    strokeWidth: 2,
                    color: controller.todo.theme.color,
                    strokeCap: StrokeCap.round,
                  ),
                ),
              ),
              horizontalTitleGap: 0,
              title: Text(controller.todo.title),
              titleTextStyle: theme.textTheme.headlineMedium,
              subtitle: Text(
                string.tasksCount(
                    controller.todo.completionCount, controller.todo.count),
                style: const TextStyle(height: 2),
              ),
              trailing: Align(
                alignment: Alignment.bottomCenter,
                widthFactor: 1,
                heightFactor: .5,
                child: PopupMenuButton(
                  onSelected: (value) {
                    switch (value) {
                      case 'edit':
                        showTodoEditor(
                          context: context,
                          todo: controller.todo,
                          listener: (todo) => controller.editTodo(todo),
                        );
                        break;
                      case 'delete':
                        controller.deleteTodo();
                        break;
                    }
                  },
                  itemBuilder: (_) => [
                    ...{
                      'edit': {
                        'icon': Iconsax.edit,
                        'label': string.edit,
                      },
                      'delete': {
                        'icon': Iconsax.trash,
                        'label': string.delete,
                      },
                    }.entries.map(
                          (e) => PopupMenuItem(
                            value: e.key,
                            child: Row(
                              children: [
                                Icon(
                                  e.value['icon'] as IconData,
                                  size: 18,
                                  color: theme.iconTheme.color,
                                ),
                                const SizedBox(width: 10),
                                Text(e.value['label'] as String),
                              ],
                            ),
                          ),
                        )
                  ],
                  icon: const Icon(Icons.more_vert_sharp, size: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(indent: 80),
            Expanded(
              child: AnimatedList(
                key: controller.listKey,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 20),
                initialItemCount: controller.todo.tasks.length,
                itemBuilder: (context, i, animation) {
                  final task = controller.todo.tasks[i];
                  return Dismissible(
                    key: ValueKey(i),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) => controller.removeTask(task, i),
                    background: Container(
                      color: controller.todo.theme.color,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: const Icon(
                        Iconsax.trash,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    child: SizeTransition(
                      sizeFactor: animation,
                      child: TaskItem(
                          todo: controller.todo,
                          task: task,
                          onChecked: (item) => controller.updateTask(item, i),
                          onSelected: (item) => showTaskEditor(
                                context: context,
                                todo: controller.todo,
                                task: item,
                                listener: (task) =>
                                    controller.updateTask(task, i),
                              )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
