class RecipeModelUser {
  final String instructions;
  final String thumbnailUrl;
  final String name;
  final String ingredientsAndMeasurement;
  final String description;
  final int id;

  RecipeModelUser({
    required this.id,
    required this.instructions,
    required this.thumbnailUrl,
    required this.name,
    required this.ingredientsAndMeasurement,
    required this.description,
  });

  factory RecipeModelUser.fromSqfliteDatabase(Map<String, dynamic> map) =>
      RecipeModelUser(
        id: map['id']?.toInt() ?? 0,
        instructions: map['instructions']?.toString() ?? '',
        thumbnailUrl: map['thumbnail_url']?.toString() ?? '',
        name: map['name'] ?? '',
        ingredientsAndMeasurement:
            map['ingredients_and_measurement']?.toString() ?? '',
        description: map['description']?.toString() ?? '',
      );
}
