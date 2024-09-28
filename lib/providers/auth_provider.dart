import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoginPassHidden = true;
  bool get isLoginPassHidden => _isLoginPassHidden;

  void toggleLoginPasswordVisibility() {
    _isLoginPassHidden = !_isLoginPassHidden;
    notifyListeners();
  }

  bool _isRegisterPassHidden = true;
  bool get isRegisterPassHidden => _isRegisterPassHidden;

  void toggleRegisterPasswordVisibility() {
    _isRegisterPassHidden = !_isRegisterPassHidden;
    notifyListeners();
  }
}
