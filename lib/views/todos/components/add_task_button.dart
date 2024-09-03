import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddTaskButton extends StatelessWidget {
  final Color? color;
  final Function()? onPressed;

  const AddTaskButton({
    super.key,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        height: 48,
        width: 48,
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Iconsax.add,
          size: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
