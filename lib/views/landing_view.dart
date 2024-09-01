import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../viewmodels/dashboard_viewmodel.dart';
import '../widgets/base_widget.dart';
import 'others/settings_view.dart';
import 'todos/todos_view.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<DashboardViewModel>(
      model: Provider.of(context),
      builder: (context, controller, _) => Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Iconsax.menu,
          ),
        ),
        body: IndexedStack(
          index: controller.selectedTab,
          children: const [
            TodosView(),
            SettingsView(),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 72,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            currentIndex: controller.selectedTab,
            onTap: (i) => controller.selectedTab = i,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Iconsax.task_square),
                activeIcon: Icon(Iconsax.task_square5),
                label: 'Todos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.setting_44),
                activeIcon: Icon(Iconsax.setting_45),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
