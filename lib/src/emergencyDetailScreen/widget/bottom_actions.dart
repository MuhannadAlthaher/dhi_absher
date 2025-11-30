import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dhi_absher/src/emergencyDetailScreen/emergency_details_theme.dart';

class BottomActions extends StatelessWidget {
  final String? phoneNumber;

  const BottomActions({super.key, this.phoneNumber});

  Future<void> _callNumber(String number) async {
    final uri = Uri.parse("tel:$number");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint("⚠️ لا يمكن إجراء الاتصال");
    }
  }




  Future<void> _openSMS(String number) async {
    final uri = Uri.parse("sms:$number");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint("⚠️ لا يمكن فتح الرسائل");
    }
  }

  @override
  Widget build(BuildContext context) {
    final number = phoneNumber ?? "0500000000";

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [

            SizedBox(
              height: 44,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _callNumber(number),
                style: ElevatedButton.styleFrom(
                  backgroundColor: EmergencyDetailsTheme.cardColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(
                  Icons.phone,
                  color: EmergencyDetailsTheme.accentGreen,
                ),
                label: const Text(
                  'اتصال',
                  style: TextStyle(
                    color: EmergencyDetailsTheme.textWhite,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              height: 44,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  await _openSMS(number);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: EmergencyDetailsTheme.cardColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: const Icon(
                    Icons.mail,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                label: const Text(
                  'إرسال',
                  style: TextStyle(
                    color: EmergencyDetailsTheme.textWhite,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
