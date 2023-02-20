class Nutrients {
  double enercKcal;
  double procnt;
  double fat;
  double chocdf;
  double fibtg;


  Nutrients({
    required this.enercKcal,
    required this.procnt,
    required this.fat,
    required this.chocdf,
    required this.fibtg
  });

  factory Nutrients.fromJson(Map<String, Object?> jsonData) {
    return Nutrients(
        enercKcal: jsonData['ENERC_KCAL'] as double? ?? 0.0,
        procnt: jsonData['PROCNT'] as double? ?? 0.0,
        fat: jsonData['FAT'] as double? ?? 0.0,
        chocdf: jsonData['CHOCDF'] as double? ?? 0.0,
        fibtg: jsonData['FIBTG'] as double? ?? 0.0
    );
  }
}