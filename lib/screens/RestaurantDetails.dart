import 'package:flutter/material.dart';
import 'package:uber/components/RestaurantDetails/About.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            About(),
            Divider(
              thickness: 2,
            ),
            Text("Restaurant Details"),
          ],
        ),
      ),
    );
  }
}
