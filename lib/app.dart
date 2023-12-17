import 'package:flutter/material.dart';
import 'package:recipes/constants/routes.dart';
import 'package:recipes/features/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NamedRoute.initial,
      routes: {
        NamedRoute.initial: (context) => const HomePage(),
      },
    );
  }
}
