class FoodData {
  String text;
  List parsed;
  List hints;
  Map links;

  FoodData({
    required this.text,
    required this.parsed,
    required this.hints,
    required this.links,
  });

  factory FoodData.fromJson(Map<String, dynamic> json) => FoodData(
        text: json['text'] ?? "",
        parsed: json['parsed'] ?? [],
        hints: json['hints'] ?? [],
        links: json['links'] ?? {},
      );
}
