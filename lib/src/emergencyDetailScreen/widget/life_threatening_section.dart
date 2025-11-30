import 'package:dhi_absher/src/emergencyDetailScreen/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:dhi_absher/models/emergency_profile.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/emergency_details_theme.dart';

class LifeThreateningSection extends StatelessWidget {
  final EmergencyProfile profile;

  const LifeThreateningSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Panel(
      title: 'الحالات التي تهدد الحياة :',
      children: [
        const DividerLine(),
        const SizedBox(height: 10),
        if (profile.lifeCases.isEmpty)
          const Text(
            'لا توجد حالات مهددة للحياة مسجلة',
            style: TextStyle(
              color: EmergencyDetailsTheme.textGrey,
              fontSize: 12,
            ),
          )
        else
          ...profile.lifeCases.map((c) {
            final dateText = c.date != null
                ? 'التاريخ : ${c.date!.year}-${c.date!.month.toString().padLeft(2, '0')}-${c.date!.day.toString().padLeft(2, '0')}'
                : 'التاريخ : غير متوفر';

            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: BulletBlock(
                title: c.caseType,
                count: 'عدد النوبات : ${c.count}',
                date: dateText,
                description:
                    'الأعراض المصاحبة : ${c.symptoms}\nمدة النوبة التقريبية : ${c.duration}',
              ),
            );
          }),
      ],
    );
  }
}
