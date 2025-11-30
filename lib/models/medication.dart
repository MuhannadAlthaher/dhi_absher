class Medication {
  final String name;
  final String dosage;

  const Medication({required this.name, required this.dosage});

  factory Medication.fromMap(Map<String, dynamic> map) {
    return Medication(
      name: map['medication_name'] ?? '',
      dosage: map['dosage'] ?? '',
    );
  }
}