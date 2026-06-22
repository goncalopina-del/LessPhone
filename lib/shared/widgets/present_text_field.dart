import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class PresentTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final bool autofocus;

  const PresentTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onSubmitted,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      obscureText: obscureText,
      maxLines: maxLines,
      autofocus: autofocus,
      style: TextStyle(color: context.colors.onSurface, fontFamily: 'PlusJakartaSans', fontSize: 15),
      decoration: InputDecoration(hintText: hintText, prefixIcon: prefixIcon, suffixIcon: suffixIcon),
    );
  }
}
