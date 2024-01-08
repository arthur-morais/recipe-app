import 'package:flutter/material.dart';

class AppSnackbars {
  AppSnackbars._();

  static SnackBar defaultSnackbar(String content) {
    return SnackBar(
      content: Text(content),
    );
  }
}
