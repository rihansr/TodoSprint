import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../shared/strings.dart';
import '../../../widgets/clipper_widget.dart';

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
        Clipper(
          size: 56,
          color: theme.colorScheme.surface,
          radius: 12,
          shadows: [
            BoxShadow(
              color: theme.colorScheme.shadow,
              offset: const Offset(10, 10),
              blurRadius: 20,
            ),
            BoxShadow(
              color: theme.highlightColor,
              offset: const Offset(-10, -10),
              blurRadius: 20,
            ),
          ],
          child: IconButton(
            icon: const Icon(Iconsax.add),
            onPressed: onTap,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          string.addList,
          style: theme.textTheme.labelSmall,
        )
      ],
    );
  }
}
