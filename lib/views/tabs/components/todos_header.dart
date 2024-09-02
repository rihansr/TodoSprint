import 'package:flutter/material.dart';
import '../../../shared/strings.dart';

class TodosHeader extends StatelessWidget {
  const TodosHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(flex: 2, child: Divider()),
        const Spacer(),
        Text.rich(
          TextSpan(
            text: string.tasks,
            children: [
              const TextSpan(text: ' '),
              TextSpan(
                text: string.lists,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: theme.textTheme.labelSmall?.color,
                ),
              ),
            ],
            style: theme.textTheme.headlineMedium,
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        const Expanded(flex: 2, child: Divider()),
      ],
    );
  }
}
