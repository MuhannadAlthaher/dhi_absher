import 'package:dhi_absher/src/emergencyDetailScreen/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:dhi_absher/models/emergency_profile.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/emergency_details_theme.dart';

class CriticalConditionSection extends StatelessWidget {
  final EmergencyProfile profile;

  const CriticalConditionSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final chronic = profile.chronicDiseases.map((e) => e.name).join(' / ');
    final allergies = profile.allergies
        .map((e) => '${e.name} (${e.severity})')
        .join(' ، ');
    final meds = profile.medications
        .map((e) => '${e.name} (${e.dosage})')
        .join(' / ');
    final needs = profile.specialNeeds;

    return Panel(
      title: 'الحالة الطبية الحرجة :',
      titleColor: EmergencyDetailsTheme.accentGreen,
      children: [
        const DividerLine(),
        const SizedBox(height: 10),
        LabelValueRow(
          label: 'الأمراض المزمنة',
          value: chronic.isEmpty ? 'لا يوجد' : chronic,
        ),
        const SizedBox(height: 10),
        LabelValueRow(
          label: 'الحساسية الخطرة',
          value: allergies.isEmpty ? 'لا يوجد' : allergies,
        ),
        const SizedBox(height: 10),
        LabelValueRow(
          label: 'الأدوية الحرجة',
          value: meds.isEmpty ? 'لا يوجد' : meds,
        ),
        const SizedBox(height: 10),
        LabelValueRow(
          label: 'ذوي الاحتياجات الخاصة',
          value: (needs?.hasSpecialNeeds ?? false) ? 'نعم' : 'لا',
        ),
      ],
    );
  }
}
