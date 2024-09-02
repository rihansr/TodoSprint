import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../routing/routes.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../widgets/base_widget.dart';
import 'components/add_list_button.dart';
import 'components/todos_header.dart';
import '../todos/components/todo_item.dart';

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
          AddListButton(
            onTap: () => controller.addTodo(),
          ),
          const Spacer(flex: 4, key: Key('button_spacer')),
          Expanded(
            key: const Key('todos_grid'),
            flex: 10,
            child: GridView.builder(
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
                  onSelected: (item) => context.pushNamed(
                    Routes.todo,
                    extra: {'todo': item, 'index': i},
                  ),
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
