import 'package:flutter/material.dart';

class SOSProvider extends ChangeNotifier {
  bool _sosChecked = false;

  bool get sosChecked => _sosChecked;

  set sosChecked(bool value) {
    _sosChecked = value;
    notifyListeners();
  }
}
