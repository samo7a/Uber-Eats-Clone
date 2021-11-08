import 'package:flutter/material.dart';
import 'package:uber/components/RestaurantDetails/About.dart';
import 'package:uber/components/RestaurantDetails/MenuItems.dart';
import 'package:uber/models/Restaurants.dart';
import 'package:provider/provider.dart';
import 'package:uber/util/Size.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({Key? key}) : super(key: key);
  static const String id = "restaurantDetailsScreen";

  @override
  _RestaurantDetailsState createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  late final int index = ModalRoute.of(context)!.settings.arguments as int;
  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          width: size.BLOCK_WIDTH * 50,
          height: size.BLOCK_HEIGHT * 5,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.black,
          ),
          child: Center(
            child: Text(
              "View Cart",
              style: TextStyle(
                color: Colors.white,
                fontSize: size.FONT_SIZE * 20,
              ),
            ),
          ),
        ),
      ),
      body: Consumer<Restaurants>(
        builder: (context, value, child) {
          Restaurant restaurant = value.restaurants[index];
          String title = restaurant.name;
          String image = restaurant.image_url;
          List categories = restaurant.categories;
          String description = "";
          for (int i = 0; i < categories.length; i++)
            description += categories[i] + " • ";

          description +=
              "${restaurant.price} • 💳 • ${restaurant.rating}⭐ (${restaurant.review_count}+)";
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                About(
                  title: title,
                  image: image,
                  description: description,
                ),
                Divider(
                  thickness: 2,
                ),
                MenuItems(),
              ],
            ),
          );
        },
      ),
    );
  }
}
