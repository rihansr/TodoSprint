import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
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
            text: 'Tasks',
            children: [
              const TextSpan(text: ' '),
              TextSpan(
                text: 'Lists',
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

