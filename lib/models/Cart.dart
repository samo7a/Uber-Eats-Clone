import 'package:flutter/material.dart';
import 'package:uber/models/MenuItem.dart';

class Cart with ChangeNotifier {
  List<MenuItem> _items = [];
  double _totalPrice = 0;
  String _restName = "";

  set restName(String value) {
    _restName = value;
    notifyListeners();
  }

  String get restName => _restName;

  set items(List<MenuItem> list) {
    _items = [];
    notifyListeners();
  }

  set addItem(MenuItem item) {
    _items.add(item);
    _totalPrice += item.price;
    notifyListeners();
  }

  set removeItem(String id) {
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].id == id) {
        _totalPrice -= _items[i].price;
        _items.removeAt(i);
        notifyListeners();
        return;
      }
    }
  }

  void resetCart() {
    this.restName = "";
    this.totalPrice = 0;
    this.items = [];
  }

  set totalPrice(double value) {
    _totalPrice = value;
    notifyListeners();
  }

  double get totalPrice => _totalPrice;
  List<MenuItem> get items => _items;
  int get count => _items.length;

  bool contains(String id) {
    for (int i = 0; i < _items.length; i++) if (_items[i].id == id) return true;
    return false;
  }
}
