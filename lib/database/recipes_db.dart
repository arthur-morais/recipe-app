import 'package:recipes/models/recipe_user.dart';
import 'package:sqflite/sqflite.dart';
import 'database_service.dart';

class RecipesDB {
  final tableName = 'recipes';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "id" INTEGER NOT NULL,
      "instructions" TEXT NOT NULL,
      "thumbnail_url" TEXT NOT NULL,
      "name" TEXT NOT NULL,
      "ingredients_and_measurement" TEXT NOT NULL,
      "description" TEXT,
      PRIMARY KEY("id" AUTOINCREMENT)
    );""");
  }

  Future<int> create({
    required String name,
    required String instructions,
    required String thumbnailUrl,
    required String ingredientsAndMeasurement,
    required String description,
  }) async {
    final database = await DatabaseService().database;

    return await database.rawInsert(
      '''INSERT INTO $tableName (name,instructions,thumbnail_url,ingredients_and_measurement,description) VALUES (?,?,?,?,?)''',
      [
        name,
        instructions,
        thumbnailUrl,
        ingredientsAndMeasurement,
        description,
      ],
    );
  }

  Future<List<RecipeModelUser>> fetchAll() async {
    final database = await DatabaseService().database;
    final recipes = await database.rawQuery(
        '''SELECT * from $tableName ORDER BY COALESCE(name,instructions,thumbnail_url,ingredients_and_measurement,description)''');
    return recipes
        .map((recipe) => RecipeModelUser.fromSqfliteDatabase(recipe))
        .toList();
  }

  Future<RecipeModelUser> fetchById(int id) async {
    final database = await DatabaseService().database;
    final recipe = await database
        .rawQuery('''SELECT * from $tableName WHERE id = ?''', [id]);
    return RecipeModelUser.fromSqfliteDatabase(recipe.first);
  }

  Future<int> update({required int id, String? name}) async {
    final database = await DatabaseService().database;
    return await database.update(
      tableName,
      {if (name != null) 'name': name},
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [id],
    );
  }

  Future<void> delete(int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete('''DELETE FROM $tableName WHERE id = ?''', [id]);
  }
}
