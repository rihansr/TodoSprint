import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todo_sprint/shared/dimens.dart';
import '../../../models/task_model.dart';
import '../../../models/todo_model.dart';
import '../../../services/notification_service.dart';
import '../../../shared/strings.dart';
import '../../../shared/styles.dart';
import '../../../shared/utils.dart';
import '../../../widgets/input_widget.dart';

popupTaskEditor({
  required BuildContext context,
  Todo? todo,
  Task? task,
  void Function(Task task)? listener,
}) {
  showCupertinoModalPopup(
    context: context,
    filter: style.defaultBlur,
    builder: (context) => _AddTaskView(
      key: const Key('add_task_view'),
      todo: todo,
      task: task,
    ),
  ).then((task) {
    if (task != null) listener?.call(task);
  });
}

class _AddTaskView extends StatefulWidget {
  final Todo? todo;
  final Task? task;

  const _AddTaskView({
    super.key,
    this.todo,
    this.task,
  });

  @override
  State<_AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<_AddTaskView> {
  late Task? _task;
  late GlobalKey<FormState> _formKey;
  bool disableSaveOption = false;
  late TextEditingController _taskController;
  late DateTime? _timestamp;

  @override
  void initState() {
    _task = widget.task;
    _formKey = GlobalKey<FormState>();
    _taskController = TextEditingController(text: _task?.name);
    _taskController.addListener(listener);
    _timestamp = _task?.timestamp;
    super.initState();
  }

  void listener() {
    bool isEmpty = _taskController.text.trim().isEmpty;
    if (isEmpty != disableSaveOption) {
      setState(() => disableSaveOption = isEmpty);
    }
  }

  popupDatePicker() => showCupertinoModalPopup(
        context: context,
        builder: (context) => Dialog(
          alignment: Alignment.bottomCenter,
          insetPadding: const EdgeInsets.all(0),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SizedBox(
            height: dimen.height * 0.3,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              initialDateTime: _timestamp ?? DateTime.now(),
              onDateTimeChanged: (dateTime) => timestamp = dateTime,
            ),
          ),
        ),
      );

  set timestamp(DateTime? timestamp) => setState(() => _timestamp = timestamp);

  _save() async {
    if (_formKey.currentState?.validate() ?? false) {
      final task = Task(
        id: _task?.id ?? UniqueKey().hashCode,
        name: _taskController.text.trim(),
        timestamp: _timestamp,
      );

      if (_task?.timestamp != null) {
        await notificationService.cancelNotification([_task!.id]);
      }
      if (_timestamp != null) {
        if (_task?.timestamp != null) {
          await notificationService.schedule(
            task.id,
            _timestamp!,
            DateTimeComponents.dateAndTime,
          );
        }
        if (_timestamp != null) {}
      }
      context.pop(task);
    }
  }

  @override
  void dispose() {
    _taskController
      ..removeListener(listener)
      ..dispose();
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
              onPressed: () => context.pop(),
              child: Text(
                string.cancel,
                style: TextStyle(color: todoTheme?.color),
              ),
            ),
            title: Text(
              widget.task == null ? string.newTask : string.editTask,
              style: const TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            trailing: TextButton(
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
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: InputField(
                controller: _taskController,
                maxLines: 14,
                autoFocus: true,
                unfocusOnTapOutside: true,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                onFieldSubmitted: (_) => _save(),
                validator: (value) =>
                    value?.isEmpty ?? false ? string.addNameMessage : null,
              ),
            ),
          ),
          _timestamp == null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 16),
                  child: IconButton(
                    onPressed: () => popupDatePicker(),
                    icon: const Icon(Iconsax.notification),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 0, 16),
                  child: InputChip(
                    avatar: const Icon(Iconsax.notification, size: 16),
                    label: Text(_timestamp?.time ?? ''),
                    onPressed: () => popupDatePicker(),
                    onDeleted: () => timestamp = null,
                  ),
                ),
        ],
      ),
    );
  }
}
