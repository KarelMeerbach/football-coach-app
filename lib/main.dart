import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/constants/supabase_keys.dart';
import 'package:football_coach_app/providers/auth_providers.dart';
import 'package:football_coach_app/providers/theme_provider.dart';
import 'package:football_coach_app/screens/dashboard_screen.dart';
import 'package:football_coach_app/themes/AppThemes.dart';
import 'screens/auth/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Football Coach Manager',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeMode,
      home: Consumer(builder: (context, ref, child) {
        final authState = ref.watch(authStateProvider);

        return authState.when(
          data: (user) => user == null ? LoginScreen() : DashboardScreen(),
          loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
          error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
        );
      }),
    );
  }
}