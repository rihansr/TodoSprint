import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/todos_viewmodel.dart';
import '../../widgets/base_widget.dart';
import 'components/add_list_button.dart';
import 'components/title_bar.dart';
import 'components/todo_item.dart';

class TodosView extends StatelessWidget {
  const TodosView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<TodosViewModel>(
      model: Provider.of(context),
      onInit: (controller) => controller.fetchTodos(),
      builder: (context, controller, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TitleBar(),
          const Spacer(flex: 1),
          AddListButton(
            onTap: () => controller.addTodo(),
          ),
          const Spacer(flex: 44),
          Expanded(
            flex: 5,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 26),
              scrollDirection: Axis.horizontal,
              itemCount: controller.todos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.75,
              ),
              itemBuilder: (context, i) {
                final todo = controller.todos[i];
                return TodoItem(
                  key: ValueKey(todo.id),
                  todo: todo,
                  onSelected: (item) => {},
                );
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
