import 'package:dio/dio.dart';
import 'package:foods_app_api/data/api_services/api_client.dart';
import 'package:foods_app_api/data/models/food_model/food_model.dart';
import 'package:foods_app_api/data/models/my_response/my_response.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getFoodsData() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response =
          await dio.get("${dio.options.baseUrl}/v2/parser", queryParameters: {
        'app_id': "05d387a1",
        'app_key': 'fce49db6c7b785162e3a3809b834f72a',
      });
      if (response.statusCode == 200) {
        myResponse.data = (response.data as List?)
                ?.map((e) => FoodData.fromJson(e))
                .toList() ??
            [];
      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}
