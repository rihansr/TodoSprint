import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String label;
  final String? sublabel;
  const Header({
    super.key,
    required this.label,
    this.sublabel,
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
            text: label,
            children: sublabel == null
                ? null
                : [
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: sublabel,
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
