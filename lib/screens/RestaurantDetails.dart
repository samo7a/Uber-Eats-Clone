import 'package:flutter/material.dart';
import 'package:uber/components/RestaurantDetails/About.dart';
import 'package:uber/components/RestaurantDetails/MenuItems.dart';
import 'package:uber/models/Cart.dart';
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
  bool showButtomSheet = false;
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
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(10),
                //   topRight: Radius.circular(10),
                // ),
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
                MenuItems(),
              ],
            ),
          );
        },
      ),
    );
  }
}
