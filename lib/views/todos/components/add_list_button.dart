import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddListButton extends StatelessWidget {
  final Function() onTap;
  const AddListButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FloatingActionButton.small(
          onPressed: onTap,
          backgroundColor: theme.scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: theme.colorScheme.outline),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(Iconsax.add),
        ),
        const SizedBox(height: 12),
        Text(
          'Add List',
          style: theme.textTheme.labelSmall,
        )
      ],
    );
  }
}
