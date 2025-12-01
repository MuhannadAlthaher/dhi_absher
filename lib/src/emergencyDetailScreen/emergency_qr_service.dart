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

  final isValid = RegExp(r'^\d{10}$').hasMatch(nationalId);
  if (!isValid) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('الـ QR لا يحتوي على رقم هوية صالح')),
    );
    return;
  }

  final repo = EmergencyRepository(Supabase.instance.client);

  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (_) => const Center(
      child: CircularProgressIndicator(
        color: Colors.green,
      ),
    ),
  );

  try {
    debugPrint('📡 Calling repo.getProfileByNationalId...');
    final profile = await repo.getProfileByNationalId(nationalId);

    // أغلق الـ loading
    if (Navigator.canPop(context)) Navigator.pop(context);

    if (!context.mounted) return;

    if (profile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('لم يتم العثور على بيانات للمريض ($nationalId)')),
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
    if (Navigator.canPop(context)) Navigator.pop(context);

    debugPrint('❌ ERROR in handleEmergencyQr: $e');
    debugPrint(st.toString());

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('خطأ في جلب البيانات: $e')),
    );
  }
}
