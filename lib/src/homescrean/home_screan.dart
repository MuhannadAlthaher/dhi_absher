import 'package:dhi_absher/src/emergencyDetailScreen/emergency_qr_service.dart';
import 'package:flutter/material.dart';
import 'package:dhi_absher/src/homescrean/constant/constant.dart';
import 'package:dhi_absher/src/homescrean/widget/home_drawer.dart';
import 'package:dhi_absher/src/homescrean/widget/home_bottom_qr_button.dart';
import 'package:dhi_absher/src/homescrean/widget/home_empty_state.dart';
import 'package:dhi_absher/src/homescrean/widget/home_header.dart';
import 'package:dhi_absher/utility/qr_scanner_screen.dart';


class HomeScrean extends StatefulWidget {
  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  const HomeScrean({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {

  Future<void> _openQrScanner(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QrScannerScreen()),
    );

    if (!mounted || result == null) return;

    await handleEmergencyQr(context, result.toString());
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? HomeColors.background : Colors.white,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Builder(
          builder: (ctx) => HomeHeader(
            onMenuPressed: () => Scaffold.of(ctx).openDrawer(),
          ),
        ),
      ),

      drawer: HomeDrawer(
        onThemeChanged: widget.onThemeChanged,
      ),

      body: Center(
        child: HomeEmptyState(
          onQrPressed: () => _openQrScanner(context),
        ),
      ),

      bottomSheet: HomeBottomQrButton(
        onPressed: () => _openQrScanner(context),
      ),
    );
  }
}
