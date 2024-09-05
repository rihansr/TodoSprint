import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../shared/drawables.dart';
import '../../shared/strings.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../widgets/base_widget.dart';
import '../todos/components/todo_item.dart';
import 'components/add_todo_button.dart';
import 'components/header.dart';
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
          Header(
            key: const Key('todos_header'),
            label: Strings.of(context).tasks,
            sublabel: Strings.of(context).lists,
          ),
          const Spacer(flex: 2, key: Key('header_spacer')),
          AddTodoButton(
            onTap: () => showTodoEditor(
              context: context,
              listener: (todo) async => controller.addTodo(todo),
            ),
          ),
          const Spacer(flex: 4, key: Key('button_spacer')),
          Expanded(
            key: const Key('todos_grid'),
            flex: 11,
            child: IndexedStack(
              index: controller.todos.isEmpty ? 0 : 1,
              children: [
                Center(
                  child: Lottie.asset(
                    drawable.emptyTodos,
                    fit: BoxFit.contain,
                  ),
                ),
                GridView.builder(
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
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
