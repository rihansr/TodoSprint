import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../viewmodels/settings_viewmodel.dart';
import '../../widgets/base_widget.dart';

class SettingsTabView extends StatelessWidget {
  const SettingsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SettingsViewModel>(
      model: SettingsViewModel(),
      builder: (context, controller, _) => const Column(),
    );
  }
}
