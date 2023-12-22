import 'package:flutter/material.dart';
import 'package:recipes/constants/colors.dart';
import 'package:recipes/constants/text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.fieldLabel,
    this.controller,
    this.validator,
  });

  final TextEditingController? controller;
  final String? fieldLabel;
  final FormFieldValidator<String>? validator;

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
      textInputAction: TextInputAction.next,
      validator: widget.validator,
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
        errorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(color: AppColors.error)),
        errorStyle: AppTextStyles.small12w500,
      ),
    );
  }
}
