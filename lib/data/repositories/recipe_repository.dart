import 'dart:convert';

import 'package:recipes/data/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeRepository {
  static Future<List<RecipeModel>> getRecipe() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": '0', "size": '20', "tags": 'under_30_minutes'});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '8fecb11ed0msh7b37619092ae1f2p11de08jsnfc6426fd23a4',
      'X-RapidAPI-Host': 'tasty.p.rapidapi.com',
      'useQueryString': "true"
    });

    Map data = jsonDecode(response.body);
    List recipes = [];

    for (var result in data['results']) {
      recipes.add(result);
    }

    return RecipeModel.recipesFromSnapshot(recipes);
  }
}
