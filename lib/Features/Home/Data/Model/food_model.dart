import 'dart:convert';

class FoodItem {
  final String id;
  final String name;
  final String country;
  final String image;
  final List<String> ingredients;
  final List<String> instructions;
  final String dish;

  FoodItem({
    required this.id,
    required this.name,
    required this.country,
    required this.image,
    required this.ingredients,
    required this.instructions,
    required this.dish,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      country: json['country'] ?? '',
      image: json['image'] ?? '',
      ingredients: json['ingredients'] != null
          ? List<String>.from(json['ingredients'])
          : [],
      instructions: json['instructions'] != null
          ? List<String>.from(json['instructions'])
          : [],
      dish: json['dish'] ?? '',
    );
  }
}
