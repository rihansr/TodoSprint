import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../viewmodels/home_viewmodel.dart';

List<SingleChildWidget> providers = [
  ...independentService,
  ...universalService,
];

List<SingleChildWidget> independentService = [];

List<SingleChildWidget> universalService = [
  ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(context),
  ),
];
