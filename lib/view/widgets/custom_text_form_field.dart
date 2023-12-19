import 'package:flutter/material.dart';
import 'package:recipes/constants/colors.dart';
import 'package:recipes/constants/text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.fieldLabel,
    this.controller,
  });

  final TextEditingController? controller;
  final String fieldLabel;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: AppColors.neutral30),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.small14w400.apply(color: AppColors.neutral90),
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintText: widget.fieldLabel,
        hintStyle: AppTextStyles.small14w400.apply(color: AppColors.neutral30),
        border: defaultBorder,
      ),
    );
  }
}
