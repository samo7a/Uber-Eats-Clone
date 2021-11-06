import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uber/util/Size.dart';

class RestuarantItems extends StatelessWidget {
  const RestuarantItems({Key? key}) : super(key: key);

  static const List<Map<String, dynamic>> localRestaurants = [
    {
      "name": "Beachside Bar",
      "image_url":
          "https://static.onecms.io/wp-content/uploads/sites/9/2020/04/24/ppp-why-wont-anyone-rescue-restaurants-FT-BLOG0420.jpg",
      "categories": ["Cafe", "Bar"],
      "price": "\$\$",
      "reviews": 1244,
      "rating": 4.5,
    },
    {
      "name": "Benihana",
      "image_url":
          "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVzdGF1cmFudCUyMGludGVyaW9yfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
      "categories": ["Cafe", "Bar"],
      "price": "\$",
      "reviews": 1244,
      "rating": 3.7,
    },
    {
      "name": "India's Grill",
      "image_url":
          "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVzdGF1cmFudCUyMGludGVyaW9yfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
      "categories": ["Indian", "Bar"],
      "price": "\$\$\$",
      "reviews": 700,
      "rating": 4.9,
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(size.BLOCK_WIDTH * 3),
        margin: EdgeInsets.only(top: size.BLOCK_HEIGHT * 1),
        child: Column(
          children: [
            for (int i = 0; i < localRestaurants.length; i++)
              Column(
                children: [
                  RestaurantImage(
                    image: localRestaurants[i]["image_url"],
                  ),
                  RestaurantInfo(
                    name: localRestaurants[i]["name"],
                    rating: localRestaurants[i]["rating"],
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class RestaurantImage extends StatelessWidget {
  const RestaurantImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    return Stack(
      children: [
        Image.network(
          image,
          // scale: 0.5,
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
      padding: EdgeInsets.all(size.BLOCK_WIDTH * 2),
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
                "30-45 * min",
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
