import 'package:flutter/material.dart';

class TextProvider extends ChangeNotifier {
  String _displayText = 'Initial Text';

  String get displayText => _displayText;

  void changeText() {
    _displayText = 'New Text!';
    notifyListeners();
  }
}