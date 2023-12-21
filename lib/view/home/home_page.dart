import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recipes/constants/colors.dart';
import 'package:recipes/constants/text_styles.dart';
import 'package:recipes/data/models/recipe.dart';
import 'package:recipes/data/repositories/recipe_repository.dart';
import 'package:recipes/view/widgets/recipe_card.dart';
import 'package:recipes/view/widgets/recipe_form_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  late List<RecipeModel> _recipes;
  bool _isLoading = true;

  List<Tab> homeTabs = <Tab>[
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: homeTabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
    getRecipes();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeRepository.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: homeTabs,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            newRecipeFormDialog(context);
          },
          child: const Icon(Icons.add),
        ),
        body: TabBarView(controller: _tabController, children: <Widget>[
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                )
              : ListView.builder(
                  itemCount: _recipes.length,
                  itemBuilder: (context, index) => RecipeCard(
                    name: _recipes[index].name,
                    ingredientsAndMeasurements:
                        _recipes[index].ingredientsAndMeasurement,
                    thumbnailUrl: _recipes[index].thumbnailUrl,
                    instructions: _recipes[index].instructions,
                    description: _recipes[index].description,
                  ),
                ),
          Center(
            child: Text('Custom Recipes'),
          ),
        ]));
  }
}
