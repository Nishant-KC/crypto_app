import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.validationString,
    required this.regExString,
    required this.controller,
    this.onChanged,
    this.keyboardType,
    this.maxLength,
    this.focusNode,
    this.prefixIcon, // New property for prefix
    this.suffixIcon,
    this.isPassword, // New property for suffix
  });

  final String hintText;
  final String validationString;
  final String regExString;
  final int? maxLength;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final Widget? prefixIcon; // New optional property for prefix widget
  final Widget? suffixIcon; // New optional property for suffix widget

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      obscureText: isPassword ?? false,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return validationString;
        }
        return null;
      },
      maxLength: maxLength ?? 50,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(regExString)),
      ],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white38),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        hintText: hintText,
        hintStyle:
        Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.white38,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white38),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        counterText: '', // Optionally hide the character counter text
      ),
    );
  }
}
