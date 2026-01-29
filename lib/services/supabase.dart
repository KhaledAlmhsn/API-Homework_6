import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBase {
  final supabase = Supabase.instance.client;

  // Email and password sign up
  signUp({required String email, required String password}) async {
    return await supabase.auth.signUp(email: email, password: password);
  }

  // Email and password login
  logIn({required String email, required String password}) async {
    return await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // Magic link login
  void otp({required String email}) async {
    return await supabase.auth.signInWithOtp(email: email);
  }
}
