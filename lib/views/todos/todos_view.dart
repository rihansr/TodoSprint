import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../models/todo_model.dart';
import '../../viewmodels/todos_viewmodel.dart';
import 'components/add_task_button.dart';
import 'components/todo_indicator.dart';
import 'views/add_task_view.dart';
import 'views/todo_page_view.dart';

class TodosView extends StatelessWidget {
  final Todo todo;
  final int index;
  const TodosView({
    super.key,
    required this.todo,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodosViewModel>.value(
      value: TodosViewModel(context, todo: todo, index: index),
      child: Consumer<TodosViewModel>(
        builder: (context, controller, _) => Scaffold(
          appBar: AppBar(
            key: const Key('todos_app_bar'),
            leading: const Icon(
              Iconsax.menu,
            ),
          ),
          body: PageView.builder(
            key: const Key('todos_page_view'),
            physics: const BouncingScrollPhysics(),
            controller: controller.pageController,
            itemCount: controller.todos.length,
            onPageChanged: (i) {
              controller.index.value = i;
              controller.todo = controller.todos[i];
            },
            itemBuilder: (context, i) {
              final todo = controller.todos[i];
              return TodoPage(
                key: PageStorageKey(todo.id),
                todo: todo,
                onUpdate: controller.refreshTodo,
                listener: (onAddTask) => controller.addTaskListener = onAddTask,
              );
            },
          ),
          bottomNavigationBar: SizedBox(
            key: const Key('todos_bottom_navigation_bar'),
            height: 72,
            child: ValueListenableBuilder(
                valueListenable: controller.index,
                builder: (_, i, __) {
                  final todo = controller.todos[i];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TodoIndicator(
                          todos: controller.todos,
                          currentIndex: i,
                          onSelected: (i) {
                            controller.index.value = i;
                            controller.page = i;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: AddTaskButton(
                          color: todo.theme.color,
                          onPressed: () => popupTaskEditor(
                            context: context,
                            todo: controller.todo,
                            listener: controller.addTaskListener,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
