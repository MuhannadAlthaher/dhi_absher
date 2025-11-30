class LifeThreateningCase {
  final String caseType;
  final int count;
  final DateTime? date;
  final String symptoms;
  final String duration;

  const LifeThreateningCase({
    required this.caseType,
    required this.count,
    this.date,
    required this.symptoms,
    required this.duration,
  });

  factory LifeThreateningCase.fromMap(Map<String, dynamic> map) {
    return LifeThreateningCase(
      caseType: map['case_type'] ?? '',
      count: (map['count'] ?? 0) as int,
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
      symptoms: map['symptoms'] ?? '',
      duration: map['duration'] ?? '',
    );
  }
}