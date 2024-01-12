import 'package:flutter/material.dart';
import 'package:recipes/constants/colors.dart';
import 'package:recipes/constants/text_styles.dart';

class AppSnackbars {
  AppSnackbars._();

  static SnackBar defaultSnackbar(String content) {
    return SnackBar(
      content: Text(content, style: AppTextStyles.small16w700.apply(color: AppColors.white)),
      backgroundColor: AppColors.primary,
    );
  }
}
