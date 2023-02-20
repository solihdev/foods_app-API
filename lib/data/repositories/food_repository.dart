import 'package:foods_app_api/data/api_services/api_service.dart';
import 'package:foods_app_api/data/models/my_response/my_response.dart';

class FoodRepo {
  FoodRepo({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getAllFoods() => apiService.getFoodsData();
}