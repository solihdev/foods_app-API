import 'package:foods_app_api/data/models/food_model/helper_models/nutrients.dart';

class Food {
  String foodId;
  String label;
  String knownAs;
  Nutrients nutrients;
  String category;
  String categoryLabel;
  String image;

  Food({
    required this.foodId,
    required this.label,
    required this.knownAs,
    required this.nutrients,
    required this.category,
    required this.categoryLabel,
    required this.image,
  });

  factory Food.fromJson(Map<String, dynamic> jsonData) {
    return Food(
      foodId: jsonData['foodId'] ?? '',
      label: jsonData['label'] ?? '',
      knownAs: jsonData['knownAs'] ?? '',
      nutrients: Nutrients.fromJson(jsonData['nutrients']),
      category: jsonData['category'] ?? '',
      categoryLabel: jsonData['categoryLabel'] ?? '',
      image: jsonData['image'] ?? '',
    );
  }
}
