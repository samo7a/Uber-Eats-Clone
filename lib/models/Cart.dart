import 'package:flutter/material.dart';
import 'package:uber/models/MenuItem.dart';

class Cart with ChangeNotifier {
  List<MenuItem> _items = [];
  double _totalPrice = 0;

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

  double get totalPrice => _totalPrice;
  List<MenuItem> get items => _items;
  int get count => _items.length;

  bool contains(String id) {
    for (int i = 0; i < _items.length; i++) if (_items[i].id == id) return true;
    return false;
  }
}
