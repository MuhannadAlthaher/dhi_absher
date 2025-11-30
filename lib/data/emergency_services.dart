import 'package:dhi_absher/models/allergy.dart';
import 'package:dhi_absher/models/chronic_disease.dart';
import 'package:dhi_absher/models/emergency_contact';
import 'package:dhi_absher/models/emergency_profile.dart';
import 'package:dhi_absher/models/life_threatening_case.dart';
import 'package:dhi_absher/models/medication.dart';
import 'package:dhi_absher/models/special_needs.dart';
import 'package:dhi_absher/models/surgery.dart';
import 'package:dhi_absher/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class EmergencyRepository {
  final SupabaseClient _client;

  EmergencyRepository(SupabaseClient client) : _client = client;

  Future<EmergencyProfile?> getProfileByNationalId(String nationalId) async {
    final userMap = await _client
        .from('users')
        .select()
        .eq('national_id', int.parse(nationalId))
        .maybeSingle();

    if (userMap == null) return null;

    final user = UserModel.fromMap(userMap);
    final userId = user.nationalId;

    final results = await Future.wait<dynamic>([
      _client
          .from('chronic_diseases')
          .select()
          .eq('user_id', userId),
      _client
          .from('allergies')
          .select()
          .eq('user_id', userId),
      _client
          .from('medications')
          .select()
          .eq('user_id', userId),
      _client
          .from('special_needs')
          .select()
          .eq('user_id', userId)
          .maybeSingle(),
      _client
          .from('life_threatening_cases')
          .select()
          .eq('user_id', userId),
      _client
          .from('surgeries')
          .select()
          .eq('user_id', userId),
      _client
          .from('emergency_contacts')
          .select()
          .eq('user_id', userId),
    ]);

    final chronicList = (results[0] as List)
        .map((e) => ChronicDisease.fromMap(e as Map<String, dynamic>))
        .toList();

    final allergyList = (results[1] as List)
        .map((e) => Allergy.fromMap(e as Map<String, dynamic>))
        .toList();

    final medsList = (results[2] as List)
        .map((e) => Medication.fromMap(e as Map<String, dynamic>))
        .toList();

    final specialNeedsMap = results[3] as Map<String, dynamic>?;

    final lifeCasesList = (results[4] as List)
        .map((e) => LifeThreateningCase.fromMap(e as Map<String, dynamic>))
        .toList();

    final surgeriesList = (results[5] as List)
        .map((e) => Surgery.fromMap(e as Map<String, dynamic>))
        .toList();

    final contactsList = (results[6] as List)
        .map((e) => EmergencyContact.fromMap(e as Map<String, dynamic>))
        .toList();

    return EmergencyProfile(
      user: user,
      chronicDiseases: chronicList,
      allergies: allergyList,
      medications: medsList,
      specialNeeds:
          specialNeedsMap != null ? SpecialNeeds.fromMap(specialNeedsMap) : null,
      lifeCases: lifeCasesList,
      surgeries: surgeriesList,
      contacts: contactsList,
    );
  }
}
