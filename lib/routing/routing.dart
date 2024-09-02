import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/todo_model.dart';
import '../services/navigation_service.dart';
import '../views/landing_view.dart';
import '../views/todos/todos_view.dart';
import 'routes.dart';

final GoRouter routing = GoRouter(
  navigatorKey: navigator.navigatorKey,
  initialLocation: Routes.landing,
  routes: <RouteBase>[
    GoRoute(
      name: Routes.landing,
      path: Routes.landing,
      builder: (BuildContext context, GoRouterState state) {
        return const LandingView();
      },
    ),
    GoRoute(
      name: Routes.todo,
      path: Routes.todo,
      builder: (BuildContext context, GoRouterState state) {
        final data = state.extra as Map<String, dynamic>;
        return TodosView(
          todo: data['todo'] as Todo,
          index: data['index'] as int? ?? 0,
        );
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(),
    body: const Center(
      child: Text('Page not found'),
    ),
  ),
);
