import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_sprint/main.dart' as app;
import 'package:todo_sprint/views/landing_view.dart';
import 'package:todo_sprint/views/tabs/components/add_todo_button.dart';
import 'package:todo_sprint/views/tabs/home_tab_view.dart';
import 'package:todo_sprint/views/tabs/settings_tab_view.dart';
import 'package:todo_sprint/views/tabs/views/add_todo_view.dart';
import 'package:todo_sprint/views/todos/todos_view.dart';
import 'package:todo_sprint/views/todos/views/add_task_view.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('App Integration Test', () {
    testWidgets('Check app functionalities', (WidgetTester tester) async {
      await app.main();
      await tester.pumpAndSettle();

      // Verify initial state
      await _verifyLandingView(tester);

      // Add a new todo
      await _addNewTodo(tester);

      // Navigate to TodosView
      await _navigateToTodosView(tester);

      // Add a new task to the todo
      await _addNewTask(tester);

      // Edit newly added task
      await _editTask(tester);

      // Navigate back to LandingView
      await _navigateBackToLandingView(tester);

      // Navigate to TodosView
      await _navigateToTodosView(tester);

      // Complete the task
      await _completeTask(tester);

      // Edit todo
      await _editTodo(tester);

      // Delet todo
      await _deleteTodo(tester);

      // Navigate back to LandingView
      await _navigateBackToLandingView(tester);

      // Change settings
      await _changeSettings(tester);
    });
  });
}

Future<void> _verifyLandingView(WidgetTester tester) async {
  expect(find.byType(LandingView), findsOneWidget);
  expect(find.byType(HomeTabView), findsOneWidget);
}

Future<void> _addNewTodo(WidgetTester tester) async {
  await tester.tap(find.byType(AddTodoButton));
  await tester.pumpAndSettle();

  expect(find.byType(AddTodoView), findsOneWidget);

  await tester.enterText(
      find.byKey(const Key('todo_title_input_field')), 'New Todo');
  await tester.enterText(find.byKey(const Key('todo_description_input_field')),
      'New Todo Description');
  await tester.pump();

  await tester.tap(find.byKey(const Key('todo_save_text_button')));
  await tester.pumpAndSettle(const Duration(seconds: 2));

  expect(find.byType(HomeTabView), findsOneWidget);
  expect(find.text('New Todo'), findsOneWidget);
}

_navigateToTodosView(WidgetTester tester) async {
  await tester.tap(find.text('New Todo'));
  await tester.pumpAndSettle();
}

Future<void> _addNewTask(WidgetTester tester) async {
  expect(find.byType(TodosView), findsOneWidget);

  await tester.tap(find.byKey(const Key('add_task_button')));
  await tester.pumpAndSettle();

  expect(find.byType(AddTaskView), findsOneWidget);

  await tester.enterText(
      find.byKey(const Key('task_name_input_field')), 'New Task');
  await tester.pump();

  await tester.tap(find.byKey(const Key('task_save_text_button')));
  await tester.pumpAndSettle(const Duration(seconds: 2));

  expect(find.byType(TodosView), findsOneWidget);
}

_editTask(WidgetTester tester) async {
  expect(find.text('New Task'), findsOneWidget);
  await tester.longPress(find.text('New Task'));
  await tester.pumpAndSettle();

  expect(find.byType(AddTaskView), findsOneWidget);

  await tester.enterText(
      find.byKey(const Key('task_name_input_field')), 'Task Updated');
  await tester.pump();

  await tester.tap(find.byKey(const Key('task_save_text_button')));
  await tester.pumpAndSettle(const Duration(seconds: 2));

  expect(find.byType(TodosView), findsOneWidget);
}

Future<void> _navigateBackToLandingView(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key('app_bar_leading_button')));
  await tester.pumpAndSettle();

  expect(find.byType(LandingView), findsOneWidget);
}

_completeTask(WidgetTester tester) async {
  expect(find.text('Task Updated'), findsOneWidget);
  await tester.tap(find.text('Task Updated'));
  await tester.pumpAndSettle(Durations.extralong4);
}

_editTodo(WidgetTester tester) async {
  // Tap on PopupMenuButton
  await tester.tap(find.byKey(const Key('todo_actions_popup_menu_button')));
  await tester.pumpAndSettle(Durations.extralong1);

  // Select edit
  await tester.tap(find.byKey(const Key('edit_key')));
  await tester.pumpAndSettle(Durations.extralong1);

  expect(find.byType(AddTodoView), findsOneWidget);

  await tester.enterText(
      find.byKey(const Key('todo_title_input_field')), 'Updated Todo');
  await tester.enterText(find.byKey(const Key('todo_description_input_field')),
      'Todo updated now');
  await tester.pump();

  await tester.tap(find.byKey(const Key('todo_save_text_button')));
  await tester.pumpAndSettle(const Duration(seconds: 2));

  expect(find.byType(TodosView), findsOneWidget);
}

_deleteTodo(WidgetTester tester) async {
  // Tap on PopupMenuButton
  await tester.tap(find.byKey(const Key('todo_actions_popup_menu_button')));
  await tester.pumpAndSettle(Durations.extralong1);

  // Select Delete
  await tester.tap(find.byKey(const Key('delete_key')));
  await tester.pumpAndSettle(Durations.extralong4);
}

Future<void> _changeSettings(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key('settings_tab')));
  await tester.pumpAndSettle();

  expect(find.byType(SettingsTabView), findsOneWidget);

  await tester.tap(find.byKey(const ValueKey('spanish')));
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const ValueKey('system')));
  await tester.pumpAndSettle();
}