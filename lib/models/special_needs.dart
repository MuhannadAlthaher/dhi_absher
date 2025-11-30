class SpecialNeeds {
  final bool hasSpecialNeeds;
  final String? notes;

  const SpecialNeeds({required this.hasSpecialNeeds, this.notes});

  factory SpecialNeeds.fromMap(Map<String, dynamic> map) {
    return SpecialNeeds(
      hasSpecialNeeds: map['has_special_needs'] ?? false,
      notes: map['notes'],
    );
  }
}