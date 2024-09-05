import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  final Function()? onTapLeading;

  const CustomAppBar({
    this.title,
    this.leading,
    this.trailing,
    this.onTapLeading,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(128);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      title: title,
      leadingWidth: 72,
      leading: leading == null && onTapLeading == null
          ? null
          : Center(
              child: IconButton(
                onPressed: onTapLeading,
                color: theme.iconTheme.color,
                padding: const EdgeInsets.all(0),
                icon: leading!,
              ),
            ),
      actions: trailing == null ? null : [trailing!],
    );
  }
}
