// lib/src/emergencyDetailScreen/emergency_details_screen.dart
import 'package:dhi_absher/src/emergencyDetailScreen/widget/basic_info_section.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/widget/bottom_actions.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/widget/critical_condition_section.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/widget/emergency_contacts_section.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/widget/emergency_header.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/widget/life_threatening_section.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/widget/surgeries_section.dart';
import 'package:flutter/material.dart';
import 'package:dhi_absher/models/emergency_profile.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/emergency_details_theme.dart';

class EmergencyDetailsScreen extends StatelessWidget {
  final EmergencyProfile profile;

  const EmergencyDetailsScreen({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EmergencyDetailsTheme.bgOutside,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 24,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 20,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: EmergencyDetailsTheme.cardColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const EmergencyHeader(),
                        const SizedBox(height: 16),
                        BasicInfoSection(user: profile.user, profile: profile),
                        const SizedBox(height: 16),
                        CriticalConditionSection(profile: profile),
                        const SizedBox(height: 16),
                        LifeThreateningSection(profile: profile),
                        const SizedBox(height: 16),
                        SurgeriesSection(profile: profile),
                        const SizedBox(height: 16),
                        EmergencyContactsSection(
                          contacts: profile.contacts,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const BottomActions(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
