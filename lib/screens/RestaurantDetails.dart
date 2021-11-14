import 'package:flutter/material.dart';
import 'package:uber/components/RestaurantDetails/About.dart';
import 'package:uber/components/RestaurantDetails/MenuItems.dart';
import 'package:uber/models/Cart.dart';
import 'package:uber/models/MenuItem.dart';
import 'package:uber/models/Restaurants.dart';
import 'package:provider/provider.dart';
import 'package:uber/screens/OrderCompleted.dart';
import 'package:uber/util/Size.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({Key? key}) : super(key: key);
  static const String id = "restaurantDetailsScreen";

  @override
  _RestaurantDetailsState createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  late final int index = ModalRoute.of(context)!.settings.arguments as int;
  bool showButtomSheet = false;
  final List<MenuItem> foods = [
    MenuItem(
      id: 111.toString(),
      title: "Lasagna",
      description: "With butter lettuce, tomato and sauce bechamel",
      price: 13.50,
      image:
          "https://www.modernhoney.com/wp-content/uploads/2019/08/Classic-Lasagna-14-scaled.jpg",
    ),
    MenuItem(
      id: 222.toString(),
      title: "Tandoori Chicken",
      description:
          "Amazing Indian dish with tenderloin chicken off the sizzle 🔥",
      price: 19.20,
      image: "https://i.ytimg.com/vi/BKxGodX9NGg/maxresdefault.jpg",
    ),
    MenuItem(
      id: 333.toString(),
      title: "Chilaquiles",
      description:
          "Chilaquiles with cheese and sauce. A delicious mexican dish",
      price: 14.50,
      image:
          "https://upload.wikimedia.org/wikipedia/commons/3/3d/Portada-chilaquiles-rojos.jpg",
    ),
    MenuItem(
      id: 444.toString(),
      title: "Chicken Caesar Salad",
      description:
          "One can never go wrong with a chicken caesar salad. Healthy options with greens and proteins",
      price: 11.99,
      image:
          "https://www.recipetineats.com/wp-content/uploads/2016/05/Caesar-Salad_7-SQ.jpg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    Cart cart = context.watch<Cart>();

    return Scaffold(
      bottomSheet: showButtomSheet
          ? Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                ),
                color: Colors.grey.withOpacity(0.1),
              ),
              height: size.BLOCK_HEIGHT * 50,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.BLOCK_HEIGHT * 2,
                    ),
                    for (int i = 0; i < cart.count; i++)
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: size.BLOCK_WIDTH * 10,
                                    height: size.BLOCK_HEIGHT * 5,
                                  ),
                                  Text(
                                    cart.items[i].title,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Row(
                                children: [
                                  Text(
                                    cart.items[i].price.toStringAsFixed(2),
                                    textAlign: TextAlign.end,
                                  ),
                                  SizedBox(
                                    width: size.BLOCK_WIDTH * 10,
                                    height: size.BLOCK_HEIGHT * 5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black87,
                            indent: 25,
                            endIndent: 25,
                          ),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: size.BLOCK_WIDTH * 10,
                              height: size.BLOCK_HEIGHT * 5,
                            ),
                            Text("Subtotal"),
                          ],
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Row(
                          children: [
                            Text(
                              cart.totalPrice.toStringAsFixed(2),
                            ),
                            SizedBox(
                              width: size.BLOCK_WIDTH * 10,
                              height: size.BLOCK_HEIGHT * 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.BLOCK_HEIGHT * 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showButtomSheet = !showButtomSheet;
                        });
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          OrderCompleted.id,
                          (route) => false,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: size.BLOCK_WIDTH * 70,
                        height: size.BLOCK_HEIGHT * 7.5,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Checkout",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.FONT_SIZE * 20,
                                ),
                              ),
                              Text(
                                "\$${cart.totalPrice.toStringAsFixed(2)}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.FONT_SIZE * 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.BLOCK_HEIGHT * 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showButtomSheet = !showButtomSheet;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: size.BLOCK_WIDTH * 70,
                        height: size.BLOCK_HEIGHT * 7.5,
                        child: Center(
                          child: Text(
                            "Go Back",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.FONT_SIZE * 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.BLOCK_HEIGHT * 2,
                    ),
                  ],
                ),
              ),
            )
          : Container(
              height: 0,
              color: Colors.transparent,
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: (cart.count == 0 || showButtomSheet)
          ? Container()
          : GestureDetector(
              onTap: () => setState(() {
                showButtomSheet = !showButtomSheet;
              }),
              child: Container(
                width: size.BLOCK_WIDTH * 50,
                height: size.BLOCK_HEIGHT * 5,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.black,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "View Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.FONT_SIZE * 20,
                        ),
                      ),
                      Text(
                        "\$${cart.totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.FONT_SIZE * 20,
                        ),
                      ),
                    ],
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
                MenuItems(foods: foods, showChecks: true),
              ],
            ),
          );
        },
      ),
    );
  }
}
