import 'package:flutter/material.dart';

class Order with ChangeNotifier {
  String _activeTap;
  String _location;
  Order(this._activeTap, this._location);

  String get activeTap => _activeTap;
  set activeTap(String value) {
    _activeTap = value;
    notifyListeners();
  }

  String get location => _location;
  set location(String value) {
    _location = value;
    notifyListeners();
  }
}
