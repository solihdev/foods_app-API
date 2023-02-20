class Measure {
  String uri;
  String label;
  double weight;


  Measure({
    required this.uri,
    required this.label,
    required this.weight
  });

  factory Measure.fromJson(Map<String, dynamic> jsonData) {
    return Measure(
      uri: jsonData['uri'] ?? '',
      label: jsonData['label'] ?? '',
      weight: jsonData['weight'] ?? 0.0,
    );
  }
}
