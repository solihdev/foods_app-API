import 'package:foods_app_api/data/api_services/api_service.dart';
import 'package:foods_app_api/data/models/my_response/my_response.dart';

class FoodRepo {
  FoodRepo({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getAllFoods(
          {String health = '',
          String nutritionType = '',
          String category = ''}) =>
      apiService.getFoodsData(
        health: health,
        nutritionType: nutritionType,
        category: category,
      );
}
