import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../viewmodels/dashboard_viewmodel.dart';
import '../viewmodels/home_viewmodel.dart';

List<SingleChildWidget> providers = [
  ...independentService,
  ...universalService,
];

List<SingleChildWidget> independentService = [];

List<SingleChildWidget> universalService = [
  ChangeNotifierProvider<DashboardViewModel>(
    create: (context) => DashboardViewModel(),
  ),
  ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(),
  ),
];
