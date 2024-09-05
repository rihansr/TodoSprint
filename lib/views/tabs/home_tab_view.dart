import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../widgets/base_widget.dart';
import '../todos/components/todo_item.dart';
import 'components/add_todo_button.dart';
import 'components/todos_header.dart';
import 'views/add_todo_view.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      model: Provider.of(context),
      onInit: (controller) => controller.fetchTodos(),
      builder: (context, controller, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TodosHeader(key: Key('todos_header')),
          const Spacer(flex: 2, key: Key('header_spacer')),
          AddTodoButton(
            onTap: () => popupTodoEditor(
              context: context,
              listener: (todo) async => controller.addTodo(todo),
            ),
          ),
          const Spacer(flex: 4, key: Key('button_spacer')),
          Expanded(
            key: const Key('todos_grid'),
            flex: 11,
            child: GridView.builder(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 26),
              scrollDirection: Axis.horizontal,
              itemCount: controller.todos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.85,
              ),
              itemBuilder: (context, i) {
                final todo = controller.todos[i];
                return TodoItem(
                  key: ValueKey(todo.id),
                  todo: todo,
                  index: i,
                  onSelected: (item) => controller.navigateTo(item, i),
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
