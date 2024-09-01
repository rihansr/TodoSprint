import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../viewmodels/dashboard_viewmodel.dart';
import '../viewmodels/todos_viewmodel.dart';

List<SingleChildWidget> providers = [
  ...independentService,
  ...universalService,
];

List<SingleChildWidget> independentService = [];

List<SingleChildWidget> universalService = [
  ChangeNotifierProvider<DashboardViewModel>(
    create: (context) => DashboardViewModel(),
  ),
  ChangeNotifierProvider<TodosViewModel>(
    create: (context) => TodosViewModel(),
  ),
];
