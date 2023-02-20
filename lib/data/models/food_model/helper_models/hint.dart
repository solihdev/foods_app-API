import 'package:foods_app_api/data/models/food_model/helper_models/food.dart';
import 'package:foods_app_api/data/models/food_model/helper_models/measure.dart';

class Hint {
  Food food;
  List<Measure> measures;

  Hint({required this.food, required this.measures});

  factory Hint.fromJson(Map<String, dynamic> jsonData) {
    return Hint(
        food: Food.fromJson(jsonData['food']),
        measures: (jsonData['measures'] as List)
            .map((json) => Measure.fromJson(json))
            .toList());
  }
}
