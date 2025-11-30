import 'package:dhi_absher/models/allergy.dart';
import 'package:dhi_absher/models/chronic_disease.dart';
import 'package:dhi_absher/models/emergency_contact';
import 'package:dhi_absher/models/life_threatening_case.dart';
import 'package:dhi_absher/models/medication.dart';
import 'package:dhi_absher/models/special_needs.dart';
import 'package:dhi_absher/models/surgery.dart';
import 'package:dhi_absher/models/user_model.dart';

class EmergencyProfile {
  final UserModel user;
  final List<ChronicDisease> chronicDiseases;
  final List<Allergy> allergies;
  final List<Medication> medications;
  final SpecialNeeds? specialNeeds;
  final List<LifeThreateningCase> lifeCases;
  final List<Surgery> surgeries;
  final List<EmergencyContact> contacts;

  const EmergencyProfile({
    required this.user,
    required this.chronicDiseases,
    required this.allergies,
    required this.medications,
    required this.specialNeeds,
    required this.lifeCases,
    required this.surgeries,
    required this.contacts,
  });
}