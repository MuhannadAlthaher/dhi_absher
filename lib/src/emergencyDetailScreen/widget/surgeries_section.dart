import 'package:dhi_absher/src/emergencyDetailScreen/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:dhi_absher/models/emergency_profile.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/emergency_details_theme.dart';

class SurgeriesSection extends StatelessWidget {
  final EmergencyProfile profile;

  const SurgeriesSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    if (profile.surgeries.isEmpty) {
      return const Panel(
        title: 'العمليات الجراحية السابقة',
        children: [
          DividerLine(),
          SizedBox(height: 10),
          Text(
            'لا توجد عمليات جراحية مسجلة',
            style: TextStyle(
              color: EmergencyDetailsTheme.textGrey,
              fontSize: 12,
            ),
          ),
        ],
      );
    }

    final first = profile.surgeries.first;

    return Panel(
      title: 'العمليات الجراحية السابقة',
      children: [
        const DividerLine(),
        const SizedBox(height: 10),
        LabelValueRow(label: 'نوع العملية', value: first.surgeryType),
        const SizedBox(height: 6),
        LabelValueRow(
          label: 'السنة',
          value: first.surgeryYear.toString(),
        ),
        const SizedBox(height: 6),
        LabelValueRow(
          label: 'ملاحظات',
          value: first.notes,
        ),
      ],
    );
  }
}
