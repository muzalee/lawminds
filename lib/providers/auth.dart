import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/prefs.dart';

class AuthProvider with ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool _obscureLoginPass = true, _obscureRegisterPass = true, _obscureConfirmPass = true;
  bool _isLoginProcess = false, _isRegisterProcess = false;

  bool get obscureLoginPass => _obscureLoginPass;
  bool get isLoginProcess => _isLoginProcess;
  bool get obscureRegisterPass => _obscureRegisterPass;
  bool get obscureConfirmPass => _obscureConfirmPass;
  bool get isRegisterProcess => _isRegisterProcess;

  set obscureLoginPass(bool val) {
    _obscureLoginPass = val;
    notifyListeners();
  }

  set isLoginProcess(bool val) {
    _isLoginProcess = val;
    notifyListeners();
  }

  set obscureRegisterPass(bool val) {
    _obscureRegisterPass = val;
    notifyListeners();
  }

  set obscureConfirmPass(bool val) {
    _obscureConfirmPass = val;
    notifyListeners();
  }

  set isRegisterProcess(bool val) {
    _isRegisterProcess = val;
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    isLoginProcess = true;
    try {
      await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      await Prefs.setIsLogin(true);
      isLoginProcess = false;
    } catch (e) {
      isLoginProcess = false;
      log('Catch Error: $e');
      throw getError('$e');
    }
  }

  Future<void> register(String email, String password) async {
    isRegisterProcess = true;
    try {
      await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      await Prefs.setIsLogin(true);
      isRegisterProcess = false;
    } catch (e) {
      isRegisterProcess = false;
      log('Catch Error: $e');
      throw getError('$e');
    }
  }

  String getError(String input) {
    int messageIndex = input.indexOf("message: ");

    if (messageIndex != -1) {
      int commaIndex = input.indexOf(',', messageIndex);

      if (commaIndex != -1) {
        String message = input.substring(messageIndex + "message: ".length, commaIndex);
        return message.trim();
      } else {
        return 'An error occurred. Please try again.';
      }
    } else {
      return 'An error occurred. Please try again.';
    }
  }
}