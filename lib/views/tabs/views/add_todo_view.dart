import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../models/theme_model.dart';
import '../../../models/todo_model.dart';
import '../../../shared/strings.dart';
import '../../../shared/styles.dart';
import '../../../shared/utils.dart';
import '../../../widgets/color_picker.dart';
import '../../../widgets/input_widget.dart';

showTodoEditor({
  required BuildContext context,
  Todo? todo,
  void Function(Todo todo)? listener,
}) {
  showCupertinoModalPopup(
    context: context,
    filter: style.defaultBlur,
    builder: (context) => AddTodoView(
      key: const Key('add_todo_view'),
      todo: todo,
    ),
  ).then((todo) {
    if (todo != null) listener?.call(todo);
  });
}

class AddTodoView extends StatefulWidget {
  final Todo? todo;

  const AddTodoView({
    super.key,
    this.todo,
  });

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  late Todo? _todo;
  late GlobalKey<FormState> _formKey;
  bool disableSaveOption = false;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late Color? themeColor;

  @override
  void initState() {
    _todo = widget.todo;
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController(text: _todo?.title);
    _titleController.addListener(listener);
    _descriptionController = TextEditingController(text: _todo?.description);
    themeColor = _todo?.theme.color;
    super.initState();
  }

  void listener() {
    bool isEmpty = _titleController.text.trim().isEmpty;
    if (isEmpty != disableSaveOption) {
      setState(() => disableSaveOption = isEmpty);
    }
  }

  _save() {
    if (_formKey.currentState?.validate() ?? false) {
      final todo = Todo(
        id: _todo?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        theme: (_todo?.theme ?? const TodoTheme()).copyWith(
          color: themeColor ?? utils.randomColor,
        ),
        timestamp: DateTime.now(),
        tasks: _todo?.tasks ?? [],
      );
      context.pop(todo);
    }
  }

  @override
  void dispose() {
    _titleController
      ..removeListener(listener)
      ..dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final todoTheme = widget.todo?.theme;
    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.all(0),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: TextButton(
              key: const Key('todo_cancel_text_button'),
              onPressed: () => context.pop(),
              child: Text(
                string.cancel,
                style: TextStyle(color: todoTheme?.color),
              ),
            ),
            title: Text(
              _todo == null ? string.newTodo : string.editTodo,
              style: const TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            trailing: TextButton(
              key: const Key('todo_save_text_button'),
              onPressed: () => _save(),
              child: Text(
                string.save,
                style: TextStyle(
                  color: disableSaveOption
                      ? theme.disabledColor
                      : todoTheme?.color,
                ),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputField(
                    key: const Key('todo_title_input_field'),
                    controller: _titleController,
                    hints: string.titleHint,
                    maxLines: 1,
                    autoFocus: true,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    onFieldSubmitted: (_) => _save(),
                    validator: (value) =>
                        value?.isEmpty ?? false ? string.addTitleMessage : null,
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    key: const Key('todo_description_input_field'),
                    controller: _descriptionController,
                    hints: string.descriptionHint,
                    minLines: 4,
                    maxLines: 14,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  const SizedBox(height: 16),
                  ColorPicker(
                    trackHeight: 24,
                    initialColor: HSVColor.fromColor(
                        themeColor ?? theme.colorScheme.primary),
                    onChanged: (HSVColor color) =>
                        setState(() => themeColor = color.toColor()),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24)
        ],
      ),
    );
  }
}
