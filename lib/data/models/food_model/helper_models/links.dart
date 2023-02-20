import 'package:foods_app_api/data/models/food_model/helper_models/next.dart';

class Links {
  Next next;

  Links({required this.next});

  factory Links.fromJson(Map<String, dynamic> jsonData) {
    return Links(next: Next.fromJson(jsonData['next']));
  }
}
