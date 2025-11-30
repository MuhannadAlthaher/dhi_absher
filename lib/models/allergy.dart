class Allergy {
  final String name;
  final String severity;

  const Allergy({required this.name, required this.severity});

  factory Allergy.fromMap(Map<String, dynamic> map) {
    return Allergy(
      name: map['allergy_name'] ?? '',
      severity: map['severity'] ?? '',
    );
  }
}