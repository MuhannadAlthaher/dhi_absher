import 'package:dhi_absher/data/emergency_services.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/emergency_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> handleEmergencyQr(
  BuildContext context,
  String qrValue,
) async {
  final nationalId = qrValue.trim();
  debugPrint('🔎 handleEmergencyQr called with: "$nationalId"');

  // تحقّق بسيط: رقم هوية 10 أرقام
  final isValid = RegExp(r'^\d{10}$').hasMatch(nationalId);
  if (!isValid) {
    debugPrint('❌ nationalId is not valid');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('الـ QR لا يحتوي على رقم هوية صالح')),
    );
    return;
  }

  final repo = EmergencyRepository(Supabase.instance.client);

  try {
    debugPrint('📡 Calling repo.getProfileByNationalId...');
    final profile = await repo.getProfileByNationalId(nationalId);
    debugPrint('📦 Profile from repo: $profile');

    if (!context.mounted) {
      debugPrint('⚠️ context not mounted بعد جلب البيانات');
      return;
    }

    if (profile == null) {
      debugPrint('⚠️ No profile found for $nationalId');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('لم يتم العثور على بيانات للمريض ($nationalId)'),
        ),
      );
      return;
    }

    debugPrint('➡️ Navigating to EmergencyDetailsScreen...');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EmergencyDetailsScreen(profile: profile),
      ),
    );
  } catch (e, st) {
    debugPrint('❌ ERROR in handleEmergencyQr: $e');
    debugPrint(st.toString());

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('خطأ في جلب البيانات: $e')),
    );
  }
}
