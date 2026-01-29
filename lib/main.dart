import 'package:flutter/material.dart';
import 'package:homework6/screens/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://nhqlsczvgrnzyzvoljej.supabase.co',
    anonKey: 'sb_publishable_Ahtn-EBKWFV2efgpH00fWg_DOkFvW2_',
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginPage());
  }
}
