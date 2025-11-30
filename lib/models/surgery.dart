class Surgery {
  final String surgeryType;
  final int surgeryYear;
  final String notes;

  const Surgery({
    required this.surgeryType,
    required this.surgeryYear,
    required this.notes,
  });

  factory Surgery.fromMap(Map<String, dynamic> map) {
    return Surgery(
      surgeryType: map['surgery_type'] ?? '',
      surgeryYear: (map['surgery_year'] ?? 0) as int,
      notes: map['notes'] ?? '',
    );
  }
}
