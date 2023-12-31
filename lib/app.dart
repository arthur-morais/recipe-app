import 'package:flutter/material.dart';
import 'package:recipes/constants/routes.dart';
import 'package:recipes/constants/theme.dart';
import 'package:recipes/view/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      initialRoute: NamedRoute.initial,
      routes: {
        NamedRoute.initial: (context) => const HomePage(),
      },
    );
  }
}
