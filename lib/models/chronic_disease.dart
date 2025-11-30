class ChronicDisease {
  final String name;

  const ChronicDisease({required this.name});

  factory ChronicDisease.fromMap(Map<String, dynamic> map) {
    return ChronicDisease(name: map['disease_name'] ?? '');
  }
}