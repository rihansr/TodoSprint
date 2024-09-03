import 'package:flutter/foundation.dart';
import '../services/notification_service.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel() {
    notificationService.init();
  }
}
