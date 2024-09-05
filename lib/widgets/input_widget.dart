import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final int minLines;
  final int maxLines;
  final bool autoFocus;
  final String? hints;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final bool unfocusOnTapOutside;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  const InputField({
    super.key,
    this.controller,
    this.minLines = 1,
    this.maxLines = 1,
    this.autoFocus = false,
    this.hints,
    this.keyboardType,
    this.unfocusOnTapOutside = false,
    this.onFieldSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(12),
    );
    return TextFormField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      autocorrect: true,
      autofocus: autoFocus,
      textCapitalization: textCapitalization,
      onTapOutside:
          unfocusOnTapOutside ? (_) => FocusScope.of(context).unfocus() : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        fillColor: theme.dividerColor,
        filled: true,
        hintText: hints,
        enabledBorder: border,
        focusedBorder: border,
      ),
      keyboardType: keyboardType,
      textInputAction: onFieldSubmitted != null ? TextInputAction.done : null,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
    );
  }
}
