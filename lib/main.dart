import 'package:dhi_absher/core/app_env.dart';
import 'package:dhi_absher/src/login/login_screan.dart';
import 'package:dhi_absher/src/them/them.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppEnv.init();
  final supabaseUrl = AppEnv.supabaseUrl;
  final supabaseAnonKey = AppEnv.supabaseAnonKey;
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  runApp(const DhiAbsherApp());
}

class DhiAbsherApp extends StatefulWidget {
  const DhiAbsherApp({super.key});

  @override
  State<DhiAbsherApp> createState() => _DhiAbsherAppState();
}

class _DhiAbsherAppState extends State<DhiAbsherApp> {
  bool _isDark = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,

      home: LoginScrean(
        isDark: _isDark,
        onThemeChanged: (value) {
          setState(() => _isDark = value);
        },
      ),
    );
  }
}
