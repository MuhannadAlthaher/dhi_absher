import 'package:flutter/foundation.dart';

@immutable
class UserModel {
  final int nationalId;
  final String fullName;
  final DateTime birthDate;
  final int age;
  final String nationality;
  final String bloodType;

  const UserModel({
    required this.nationalId,
    required this.fullName,
    required this.birthDate,
    required this.age,
    required this.nationality,
    required this.bloodType,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      nationalId: map['national_id'] as int,
      fullName: map['full_name'] ?? '',
      birthDate: DateTime.parse(map['birth_date']),
      age: (map['age'] ?? 0) as int,
      nationality: map['nationality'] ?? '',
      bloodType: map['blood_type'] ?? '',
    );
  }
}
