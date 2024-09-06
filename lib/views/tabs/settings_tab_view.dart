import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../configs/app_settings.dart';
import '../../shared/enums.dart';
import '../../shared/strings.dart';
import '../../shared/utils.dart';
import 'components/header.dart';

class SettingsTabView extends StatelessWidget {
  const SettingsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Header(
          key: const Key('todos_header'),
          label: string.app,
          sublabel: string.appearance,
        ),
        const SizedBox(height: 32),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CupertinoFormSection.insetGrouped(
                key: const ValueKey('language_inset_gourp'),
                backgroundColor: theme.scaffoldBackgroundColor,
                header: Text(string.language),
                children: Language.values
                    .map(
                      (language) => RadioListTile(
                        key: ValueKey(language.name),
                        title: Text(language.displayName,
                            style: theme.textTheme.titleSmall),
                        value: language.locale.languageCode,
                        groupValue: appSettings.language.languageCode,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 4),
                        activeColor: theme.colorScheme.primary,
                        onChanged: (_) {
                          appSettings.language = language.locale;
                        },
                      ),
                    )
                    .toList(),
              ),
              CupertinoFormSection.insetGrouped(
                key: const ValueKey('theme_inset_gourp'),
                backgroundColor: theme.scaffoldBackgroundColor,
                header: Text(string.thememode),
                children: ThemeMode.values
                    .map(
                      (mode) => RadioListTile(
                        key: ValueKey(mode.name),
                        title: Text(mode.name.capitalize,
                            style: theme.textTheme.titleSmall),
                        value: mode,
                        groupValue: appSettings.theme,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 4),
                        activeColor: theme.colorScheme.primary,
                        onChanged: (_) => appSettings.theme = mode,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
