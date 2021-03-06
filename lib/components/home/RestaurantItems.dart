import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uber/models/Cart.dart';
import 'package:uber/models/Restaurants.dart';
import 'package:uber/screens/RestaurantDetails.dart';
import 'package:uber/util/Size.dart';
import 'package:provider/provider.dart';

class RestuarantItems extends StatefulWidget {
  const RestuarantItems({
    Key? key,
  }) : super(key: key);

  @override
  State<RestuarantItems> createState() => _RestuarantItemsState();
}

class _RestuarantItemsState extends State<RestuarantItems> {
  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    return Consumer<Restaurants>(
      builder: (context, value, child) {
        return Container(
          color:
              value.restaurants.length == 0 ? Colors.transparent : Colors.white,
          padding: EdgeInsets.all(size.BLOCK_WIDTH * 3),
          margin: EdgeInsets.only(
            top: size.BLOCK_HEIGHT * 1,
            bottom: size.BLOCK_HEIGHT * 4,
          ),
          child: value.restaurants.length == 0
              ? CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  color: Colors.black,
                )
              : Column(
                  children: [
                    for (int i = 0; i < value.restaurants.length; i++)
                      Column(
                        children: [
                          RestaurantImage(
                            index: i,
                            image: value.restaurants[i].image_url,
                            name: value.restaurants[i].name,
                          ),
                          RestaurantInfo(
                            name: value.restaurants[i].name,
                            rating: value.restaurants[i].rating,
                          ),
                          Divider(
                            thickness: 3,
                            color: Colors.black,
                          ),
                          SizedBox(height: size.BLOCK_HEIGHT * 1),
                        ],
                      ),
                  ],
                ),
        );
      },
    );
  }
}

class RestaurantImage extends StatelessWidget {
  const RestaurantImage({
    Key? key,
    required this.image,
    required this.index,
    required this.name,
  }) : super(key: key);
  final String image;
  final int index;
  final String name;

  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Cart cart = Provider.of<Cart>(context, listen: false);
            cart.restName = name;
            Navigator.pushNamed(
              context,
              RestaurantDetails.id,
              arguments: index,
            );
          },
          child: Image.network(
            image,
          ),
        ),
        Positioned(
          right: size.BLOCK_WIDTH * 5,
          top: size.BLOCK_WIDTH * 5,
          child: GestureDetector(
            onTap: () {},
            child: FaIcon(
              FontAwesomeIcons.heart,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    Key? key,
    required this.name,
    required this.rating,
  }) : super(key: key);
  final String name;
  final double rating;

  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    return Padding(
      padding: EdgeInsets.all(size.BLOCK_WIDTH * 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.FONT_SIZE * 15,
                ),
              ),
              SizedBox(height: size.BLOCK_HEIGHT * 1),
              Text(
                "30-45 ??? min",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: size.FONT_SIZE * 13,
                ),
              ),
            ],
          ),
          Container(
            height: size.BLOCK_HEIGHT * 4,
            width: size.BLOCK_HEIGHT * 4,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(size.BLOCK_WIDTH * 10),
            ),
            child: Center(
              child: Text(
                rating.toString(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
