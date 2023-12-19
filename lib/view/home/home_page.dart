import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recipes/data/models/recipe.dart';
import 'package:recipes/data/repositories/recipe_repository.dart';
import 'package:recipes/view/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<RecipeModel> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeRepository.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: _isLoading
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
    );
  }
}
