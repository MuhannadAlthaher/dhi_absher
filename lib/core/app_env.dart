import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  static late String supabaseUrl;
  static late String supabaseAnonKey;

  static Future<void> init() async {
    await dotenv.load(fileName: ".env");

    supabaseUrl     = dotenv.env['SUPABASE_URL'] ?? '';
    supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';

    if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
      debugPrint(
        '⚠️ AppEnv: SUPABASE_URL أو SUPABASE_ANON_KEY فاضية! تأكد من ملف .env و pubspec',
      );
    } else {
      debugPrint('✅ AppEnv loaded. URL: $supabaseUrl');
      debugPrint('✅ AppEnv key prefix: ${supabaseAnonKey.substring(0, 10)}...');
    }
  }
}
