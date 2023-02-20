import 'package:foods_app_api/data/models/food_model/helper_models/hint.dart';

class FoodData {
  String text;
  List parsed;
  List<Hint> hints;

  // Links links;

  FoodData({
    required this.text,
    required this.parsed,
    required this.hints,
    // required this.links,
  });

  factory FoodData.fromJson(Map<String, dynamic> jsonData) {
    return FoodData(
      text: jsonData['text'] ?? '',
      parsed: jsonData['parsed'] ?? [],
      hints: (jsonData['hints'] as List)
          .map((json) => Hint.fromJson(json))
          .toList(),
      // links: Links.fromJson(jsonData['links'])
    );
  }
}
