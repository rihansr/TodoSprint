import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/todo_viewmodel.dart';
import '../../widgets/base_widget.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<TodoViewModel>(
      model: Provider.of(context),
      onInit: (controller) => {},
      builder: (context, controller, _) => Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Iconsax.menu,
          ),
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
        bottomNavigationBar: SizedBox(
          height: 72,
          child: Container(),
        ),
      ),
    );
  }
}
