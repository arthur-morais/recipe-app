import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
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
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        label: Text(widget.fieldLabel),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
