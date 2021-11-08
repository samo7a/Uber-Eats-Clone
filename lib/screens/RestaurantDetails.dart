import 'package:flutter/material.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({Key? key}) : super(key: key);
  static const String id = "restaurantDetailsScreen";
  @override
  _RestaurantDetailsState createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Restaurant Details"),
      ),
    );
  }
}
