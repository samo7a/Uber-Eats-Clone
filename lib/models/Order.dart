import 'package:flutter/material.dart';

class Order with ChangeNotifier {
  String _activeTap;
  Order(this._activeTap);

  String get activeTap => _activeTap;
  set activeTap(String value) {
    _activeTap = value;
    notifyListeners();
  }
}
