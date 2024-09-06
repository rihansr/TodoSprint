import 'package:flutter/foundation.dart';

class DashboardViewModel extends ChangeNotifier {
  
  DashboardViewModel();

  /// Setter & Getter for the selected tab index.
  /// This setter updates the [_selectedTab] field and notifies listeners
  /// about the change.
  /// Getter for the selected tab index.
  int _selectedTab = 0;
  int get selectedTab => _selectedTab;
  set selectedTab(int tab) => this
    .._selectedTab = tab
    ..notifyListeners();
}
