import 'package:flutter/material.dart';
import 'package:uber/util/Size.dart';

class MenuItems extends StatefulWidget {
  MenuItems({Key? key}) : super(key: key);

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  final List<Map<String, String>> foods = [
    {
      "title": "Lasagna",
      "description": "With butter lettuce, tomato and sauce bechamel",
      "price": "\$13.50",
      "image":
          "https://www.modernhoney.com/wp-content/uploads/2019/08/Classic-Lasagna-14-scaled.jpg",
    },
    {
      "title": "Tandoori Chicken",
      "description":
          "Amazing Indian dish with tenderloin chicken off the sizzle 🔥",
      "price": "\$19.20",
      "image": "https://i.ytimg.com/vi/BKxGodX9NGg/maxresdefault.jpg",
    },
    {
      "title": "Chilaquiles",
      "description":
          "Chilaquiles with cheese and sauce. A delicious mexican dish",
      "price": "\$14.50",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/3/3d/Portada-chilaquiles-rojos.jpg",
    },
    {
      "title": "Chicken Caesar Salad",
      "description":
          "One can never go wrong with a chicken caesar salad. Healthy options with greens and proteins!",
      "price": "\$21.50",
      "image":
          "https://www.recipetineats.com/wp-content/uploads/2016/05/Caesar-Salad_7-SQ.jpg",
    },
  ];

  bool val = true;

  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < foods.length; i++)
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: val,
                        side: BorderSide(
                          width: 16.5,
                          color: Colors.grey.shade400,
                        ),
                        fillColor: MaterialStateProperty.all(Colors.green[400]),
                        splashRadius: 50,
                        onChanged: (value) {
                          setState(() {
                            val = value!;
                          });
                        },
                      ),
                      SizedBox(
                        width: size.BLOCK_WIDTH * 3,
                      ),
                      Flexible(
                        child: FoodInfo(
                          description: foods[i]["description"] ?? "",
                          title: foods[i]["title"] ?? "",
                          price: foods[i]["price"] ?? "",
                        ),
                      ),
                      FoodImage(
                        image: foods[i]["image"] ??
                            "https://static.onecms.io/wp-content/uploads/sites/9/2020/04/24/ppp-why-wont-anyone-rescue-restaurants-FT-BLOG0420.jpg",
                      ),
                      SizedBox(
                        width: size.BLOCK_WIDTH * 3,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class FoodInfo extends StatelessWidget {
  const FoodInfo({
    Key? key,
    required this.description,
    required this.title,
    required this.price,
  }) : super(key: key);
  final String title;
  final String description;
  final String price;
  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.BLOCK_HEIGHT * 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: size.FONT_SIZE * 19,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            description,
          ),
          Text(price),
        ],
      ),
    );
  }
}

class FoodImage extends StatelessWidget {
  const FoodImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(size.BLOCK_WIDTH * 4),
      child: Image.network(
        image,
        fit: BoxFit.cover,
        height: size.BLOCK_WIDTH * 25,
        width: size.BLOCK_WIDTH * 25,
      ),
    );
  }
}
