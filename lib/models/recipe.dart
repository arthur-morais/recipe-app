class RecipeModel {
  final List instructions;
  final String thumbnailUrl;
  final String name;
  final List ingredientsAndMeasurement;
  final String description;
  final int? id;

  RecipeModel({
    this.id,
    required this.instructions,
    required this.thumbnailUrl,
    required this.name,
    required this.ingredientsAndMeasurement,
    required this.description,
  });

  factory RecipeModel.fromJson(dynamic json) {
    List<String> instructionsList = (json['instructions'] as List)
        .map((item) => item['display_text'].toString())
        .toList();

    List<String> ingredientsAndMeasurementRawText =
        (json['sections'][0]['components'] as List)
            .map((item) => item['raw_text'].toString())
            .toList();

    return RecipeModel(
      instructions: instructionsList,
      thumbnailUrl: json['thumbnail_url'] as String,
      name: json['name'] as String,
      ingredientsAndMeasurement: ingredientsAndMeasurementRawText,
      description: json['description'] as String,
    );
  }

  static List<RecipeModel> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return RecipeModel.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, description: $description, ingredients and measurement: $ingredientsAndMeasurement, instructions: $instructions, thumbnailUrl: $thumbnailUrl},';
  }
}
