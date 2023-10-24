import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _obscureLoginPass = true;
  bool _isLoginProcess = false;

  bool get obscureLoginPass => _obscureLoginPass;
  bool get isLoginProcess => _isLoginProcess;

  set obscureLoginPass(bool val) {
    _obscureLoginPass = val;
    notifyListeners();
  }

  set isLoginProcess(bool val) {
    _isLoginProcess = val;
    notifyListeners();
  }
}