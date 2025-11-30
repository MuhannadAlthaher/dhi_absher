import 'package:flutter/material.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/emergency_details_theme.dart';

class EmergencyHeader extends StatelessWidget {
  const EmergencyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).maybePop(),
          child: const Text(
            'X',
            style: TextStyle(
              color: EmergencyDetailsTheme.accentGreen,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        const Text(
          'تفاصيل حالة المريض للطوارئ',
          style: TextStyle(
            color: EmergencyDetailsTheme.textWhite,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
