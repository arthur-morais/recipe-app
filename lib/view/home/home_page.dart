import 'package:flutter/material.dart';
import 'package:recipes/constants/colors.dart';
import 'package:recipes/constants/text_styles.dart';
import 'package:recipes/database/recipes_db.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/models/recipe_user.dart';
import 'package:recipes/repositories/recipe_repository.dart';
import 'package:recipes/view/widgets/recipe_card.dart';
import 'package:recipes/view/widgets/recipe_card_user.dart';
import 'package:recipes/view/widgets/recipe_form_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // ignore: unused_field
  int _selectedIndex = 0;
  late List<RecipeModel> _recipes;
  bool _isLoading = true;

  Future<List<RecipeModelUser>>? futureRecipes;
  final recipeDB = RecipesDB();

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

  void fetchRecipes() {
    setState(() {
      futureRecipes = recipeDB.fetchAll();
    });
  }

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
    fetchRecipes();
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
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Smart Cooking',
            style: AppTextStyles.medium32w700,
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: homeTabs,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return RecipeFormDialog();
              },
            );
            fetchRecipes();
          },
          child: const Icon(Icons.add),
        ),
        body: TabBarView(controller: _tabController, children: <Widget>[
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
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
          FutureBuilder<List<RecipeModelUser>>(
            future: futureRecipes,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              } else {
                final recipes = snapshot.data!;

                return recipes.isEmpty
                    ? const Center(
                        child: Text(
                        'No recipes yet...',
                        style: AppTextStyles.medium32w700,
                      ))
                    : ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: screenHeight * 0.015,
                        ),
                        itemCount: recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = recipes[index];
                          return RecipeCardUser(
                            id: recipe.id,
                            name: recipe.name,
                            ingredientsAndMeasurements:
                                recipe.ingredientsAndMeasurement,
                            thumbnailUrl: recipe.thumbnailUrl,
                            instructions: recipe.instructions,
                            description: recipe.description,
                          );
                        },
                      );
              }
            },
          ),
        ]));
  }
}
