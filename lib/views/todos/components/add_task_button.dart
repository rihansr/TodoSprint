import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import '../../../widgets/neomorphic_widget.dart';

class AddTaskButton extends StatelessWidget {
  final Color? color;
  final Function() onPressed;

  const AddTaskButton({
    super.key,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed.call();
        HapticFeedback.lightImpact();
      },
      borderRadius: BorderRadius.circular(8),
      child: Neomorphic(
        height: 48,
        width: 48,
        borderRadius: 8,
        backgroundColor: color,
        child: const Icon(
          Iconsax.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
