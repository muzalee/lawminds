import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/prefs.dart';

class UserProvider with ChangeNotifier {
  final String _name = 'John Doe';

  String get name => _name;

  Future<void> setIsLogin(bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Prefs.isLoggedIn, val);

  }

  Future<bool> getIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Prefs.isLoggedIn) ?? false;
  }
}