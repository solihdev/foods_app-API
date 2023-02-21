import 'package:foods_app_api/data/models/my_response/my_response.dart';
import 'package:foods_app_api/service/api_services/api_service.dart';

class FoodRepo {
  late ApiService _apiService;

  FoodRepo({required ApiService apiService}) {
    _apiService = apiService;
  }

  Future<MyResponse> getAllFoods({
    String health = '',
    String nutritionType = '',
    String category = '',
  }) =>
      _apiService.getFoodsData(
        health: health,
        nutritionType: nutritionType,
        category: category,
      );
}
