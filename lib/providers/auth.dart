import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  bool _isPassHidden = true;
  bool get isPassHidden => _isPassHidden;

  void togglePasswordVisibility() {
    _isPassHidden = !_isPassHidden;
    notifyListeners();
  }
}
