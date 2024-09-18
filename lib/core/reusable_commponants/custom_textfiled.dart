import 'package:flutter/material.dart';

typedef validationFieled = String? Function(String?)?;

class CustomTextfiled extends StatelessWidget {
  final String? lable;
  final String? hintText;
  final TextInputType keyboard;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final validationFieled validator;
  const CustomTextfiled({
    super.key,
    this.lable,
    required this.keyboard,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.hintText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 11, 11, 19),
        // labelText: lable,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.headlineSmall,
        suffixIcon: suffixIcon,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8),
          child: prefixIcon,
        ),
        prefixIconConstraints: const BoxConstraints(
            maxHeight: 50, minHeight: 20, maxWidth: 40, minWidth: 20),

        // labelStyle: Theme.of(context).textTheme.bodySmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: keyboard,
      cursorColor: Theme.of(context).colorScheme.onPrimary,
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: "*",
      validator: validator,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 14,
          ),
    );
  }
}
