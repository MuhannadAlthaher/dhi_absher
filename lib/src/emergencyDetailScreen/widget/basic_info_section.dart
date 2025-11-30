import 'package:dhi_absher/models/user_model.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:dhi_absher/models/emergency_profile.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/emergency_details_theme.dart';

class BasicInfoSection extends StatelessWidget {
  final EmergencyProfile profile;

  const BasicInfoSection({
    super.key,
    required this.profile, required UserModel user,
  });

  String _formatDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final user = profile.user; 

    return Panel(
      title: 'المعلومات الأساسية :',
      children: [
        const DividerLine(),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelValueRow(label: 'الاسم', value: user.fullName),
                  const SizedBox(height: 12),
                  LabelValueRow(
                    label: 'رقم الهوية',
                    value: user.nationalId.toString(),
                  ),
                  const SizedBox(height: 12),
                  LabelValueRow(
                    label: 'تاريخ الميلاد',
                    value: _formatDate(user.birthDate),
                  ),
                  const SizedBox(height: 12),
                  LabelValueRow(
                    label: 'العمر',
                    value: user.age.toString(),
                  ),
                  const SizedBox(height: 12),
                  LabelValueRow(
                    label: 'الجنسية',
                    value: user.nationality,
                  ),
                  const SizedBox(height: 12),
                  LabelValueRow(
                    label: 'فصيلة الدم',
                    value: user.bloodType,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 46,
              height: 56,
              decoration: BoxDecoration(
                color: EmergencyDetailsTheme.bgOutside.withOpacity(.6),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white70,
                size: 28,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
