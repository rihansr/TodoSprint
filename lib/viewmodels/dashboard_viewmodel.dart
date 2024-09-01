import 'package:flutter/foundation.dart';

class DashboardViewModel extends ChangeNotifier {
  
  DashboardViewModel();

  int _selectedTab = 0;
  int get selectedTab => _selectedTab;
  set selectedTab(int tab) => this
    .._selectedTab = tab
    ..notifyListeners();
}
