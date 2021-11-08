import 'package:flutter/material.dart';
import 'package:uber/util/Size.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);
  final String title = "Farmhouse Kitchen Thai Cuisine";
  final String description = "Thai • Comfort Food • \$\$ • 💳 • ⭐ (299+)";
  final String image =
      "https://static.onecms.io/wp-content/uploads/sites/9/2020/04/24/ppp-why-wont-anyone-rescue-restaurants-FT-BLOG0420.jpg";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RestaurantImage(
          image: image,
        ),
        RestaurantTitle(
          title: title,
        ),
        RestaurantDescription(description: description),
      ],
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
    return SizedBox(
      width: double.infinity,
      child: Image.network(image),
    );
  }
}

class RestaurantTitle extends StatelessWidget {
  const RestaurantTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    return Container(
      margin: EdgeInsets.only(
        left: size.BLOCK_WIDTH * 5,
        right: size.BLOCK_WIDTH * 5,
        top: size.BLOCK_HEIGHT,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: size.FONT_SIZE * 29,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class RestaurantDescription extends StatelessWidget {
  const RestaurantDescription({
    Key? key,
    required this.description,
  }) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    return Container(
      margin: EdgeInsets.only(
        left: size.BLOCK_WIDTH * 5,
        right: size.BLOCK_WIDTH * 5,
        top: size.BLOCK_HEIGHT,
      ),
      child: Text(
        description,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: size.FONT_SIZE * 15,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
