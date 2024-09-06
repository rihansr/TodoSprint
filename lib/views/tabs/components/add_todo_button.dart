import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import '../../../shared/strings.dart';
import '../../../widgets/neomorphic_widget.dart';

class AddTodoButton extends StatelessWidget {
  final Function() onTap;
  const AddTodoButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            onTap.call();
            HapticFeedback.lightImpact();
          },
          borderRadius: BorderRadius.circular(12),
          child: const Neomorphic(
            height: 56,
            width: 56,
            child: Icon(Iconsax.add),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          string.addList,
          style: theme.textTheme.labelSmall,
        )
      ],
    );
  }
}
