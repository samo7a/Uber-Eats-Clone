import 'package:flutter/material.dart';

class Restaurants with ChangeNotifier {
  List<Restaurant> _restaurants;

  Restaurants(this._restaurants);

  List<Restaurant> get restaurants => _restaurants;
  set restaurants(List<Restaurant> res) {
    _restaurants = res;
    notifyListeners();
  }

  set addRestaurant(Restaurant res) {
    _restaurants.add(res);
    notifyListeners();
  }
}

class Restaurant {
  int index;
  String name;
  String image_url;
  double rating;
  int review_count;
  String price;
  List<String> categories;

  Restaurant({
    required this.index,
    required this.name,
    required this.image_url,
    required this.rating,
    required this.review_count,
    required this.price,
    required this.categories,
  });
}
