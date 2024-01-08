import 'package:flutter/material.dart';

import 'text_styles.dart';

class AppTabs {
  AppTabs._();

  static List<Tab> homeTabs = <Tab>[
    Tab(
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          'Default Recipes',
          style: AppTextStyles.small14w700,
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          'Custom Recipes',
          style: AppTextStyles.small14w700,
        ),
      ),
    ),
  ];
}
