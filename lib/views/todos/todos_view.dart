import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../models/todo_model.dart';
import '../../viewmodels/todos_viewmodel.dart';
import 'components/todo_indicator.dart';
import 'components/todo_page_view.dart';

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
    final theme = Theme.of(context);
    return ChangeNotifierProvider<TodosViewModel>.value(
      value: TodosViewModel(context, todo: todo, index: index),
      child: Consumer<TodosViewModel>(
        builder: (context, controller, _) => Scaffold(
          appBar: AppBar(
            leading: const Icon(
              Iconsax.menu,
            ),
          ),
          body: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: controller.pageController,
            itemCount: controller.todos.length,
            onPageChanged: (i) => controller.index.value = i,
            itemBuilder: (context, i) {
              final todo = controller.todos[i];
              return TodoPage(
                key: PageStorageKey(todo.id),
                todo: todo,
              );
            },
          ),
          bottomNavigationBar: SizedBox(
            height: 72,
            child: ValueListenableBuilder(
                valueListenable: controller.index,
                builder: (_, i, __) {
                  final todo = controller.todos[i];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TodoIndicator(
                          todos: controller.todos,
                          currentIndex: i,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: FloatingActionButton.small(
                          heroTag: null,
                          backgroundColor: todo.theme?.color,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          onPressed: () {},
                          child: const Icon(Iconsax.add),
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
