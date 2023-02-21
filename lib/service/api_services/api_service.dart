import 'package:dio/dio.dart';
import 'package:foods_app_api/data/models/food_model/food_model.dart';
import 'package:foods_app_api/data/models/my_response/my_response.dart';
import 'package:foods_app_api/service/api_services/api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getFoodsData({
    required String health,
    required String nutritionType,
    required String category,
  }) async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(
        dio.options.baseUrl,
        queryParameters: getQueryParams(
          health: health,
          nutritionType: nutritionType,
          category: category,
        ),
      );
      if (response.statusCode == 200) {
        print('statusCode ${response.statusCode}');
        myResponse.data =
            FoodData.fromJson(response.data as Map<String, dynamic>);
        print('statusCode ${myResponse.data}');
      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}

Map<String, dynamic> getQueryParams({
  required String nutritionType,
  required String health,
  required String category,
  required,
}) {
  Map<String, dynamic> mapData = {
    'app_id': "58c04146",
    'app_key': '8e529be1284cc2aa8ffc21fcaa28a47c',
  };
  List<String> fields = [
    "nutritionType",
    "health",
    "category",
  ];

  List<dynamic> values = [
    nutritionType,
    health,
    category,
  ];

  for (int i = 0; i < values.length; i++) {
    if (values[i].isNotEmpty) {
      mapData[fields[i]] = values[i];
    }
  }
  print("RESULT:$mapData");
  return mapData;
}

List<DietData> list = [
  DietData(
    keyText: "balanced",
    uzbekTranslation: "Me'yorida",
    russianTranslation: "Normalniy",
  ),
];

class DietData {
  final String keyText;
  final String uzbekTranslation;
  final String russianTranslation;

  DietData({
    required this.keyText,
    required this.uzbekTranslation,
    required this.russianTranslation,
  });
}
