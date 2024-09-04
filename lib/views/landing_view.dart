import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../shared/strings.dart';
import '../viewmodels/dashboard_viewmodel.dart';
import '../widgets/base_widget.dart';
import 'tabs/settings_tab_view.dart';
import 'tabs/home_tab_view.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<DashboardViewModel>(
      model: DashboardViewModel(),
      builder: (context, controller, _) => Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Iconsax.menu,
          ),
        ),
        body: IndexedStack(
          index: controller.selectedTab,
          children: const [
            HomeTabView(),
            SettingsTabView(),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 72,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            currentIndex: controller.selectedTab,
            onTap: (i) => controller.selectedTab = i,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Iconsax.task_square),
                activeIcon: const Icon(Iconsax.task_square5),
                label: string.todos,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Iconsax.setting_44),
                activeIcon: const Icon(Iconsax.setting_45),
                label: string.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
