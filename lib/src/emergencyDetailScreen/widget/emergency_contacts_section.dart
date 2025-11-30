import 'package:dhi_absher/models/emergency_contact';
import 'package:dhi_absher/src/emergencyDetailScreen/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/emergency_details_theme.dart';

class EmergencyContactsSection extends StatelessWidget {
  final List<EmergencyContact> contacts;

  const EmergencyContactsSection({
    super.key,
    required this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    EmergencyContact? primary;
    final others = <EmergencyContact>[];

    if (contacts.isNotEmpty) {
      primary = contacts.first;
      if (contacts.length > 1) {
        others.addAll(contacts.skip(1));
      }
    }

    return Panel(
      title: 'أرقام الطوارئ / الاتصال العاجل',
      titleColor: EmergencyDetailsTheme.accentGreen,
      children: [
        const SizedBox(height: 6),
        if (primary != null)
          Container(
            decoration: BoxDecoration(
              color: EmergencyDetailsTheme.panelColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Column(
              children: [
                ContactRow(
                  title: primary.relation,
                  name: primary.name,
                  phone: primary.phone,
                ),
              ],
            ),
          )
        else
          const Text(
            'لا توجد أرقام طوارئ مسجلة',
            style: TextStyle(
              color: EmergencyDetailsTheme.textGrey,
              fontSize: 12,
            ),
          ),
        const SizedBox(height: 10),
        ...others.map(
          (c) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: EmptyContactBox(title: c.relation),
          ),
        ),
      ],
    );
  }
}
