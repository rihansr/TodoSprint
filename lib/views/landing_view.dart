import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../shared/app_icons.dart';
import '../shared/strings.dart';
import '../viewmodels/dashboard_viewmodel.dart';
import '../widgets/app_bar_widget.dart';
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
        appBar: CustomAppBar(
          leading: Hero(
            tag: 'app_bar_leading',
            child: Icon(
              AppIcons.logo,
              size: 32,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
        body: IndexedStack(
          index: controller.selectedTab,
          children: const [
            HomeTabView(key: PageStorageKey('HomeTabView')),
            SettingsTabView(key: PageStorageKey('SettingsTabView')),
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
                key: const Key('home_tab'),
                icon: const Icon(Iconsax.task_square),
                activeIcon: const Icon(Iconsax.task_square5),
                label: string.todos,
              ),
              BottomNavigationBarItem(
                key: const Key('settings_tab'),
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
