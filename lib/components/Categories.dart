import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uber/util/Size.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Map<String, String>> items = [
    {
      "image": "assets/images/shopping-bag.png",
      "text": "Pick-up",
    },
    {
      "image": "assets/images/soft-drink.png",
      "text": "Soft Drinks",
    },
    {
      "image": "assets/images/bread.png",
      "text": "Backery Items",
    },
    {
      "image": "assets/images/fast-food.png",
      "text": "Fast Foods",
    },
    {
      "image": "assets/images/deals.png",
      "text": "Deals",
    },
    {
      "image": "assets/images/coffee.png",
      "text": "Coffee & Tea",
    },
    {
      "image": "assets/images/desserts.png",
      "text": "Desserts",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(size.BLOCK_WIDTH * 2),
      margin: EdgeInsets.only(top: size.BLOCK_HEIGHT * 1),
      child: SizedBox(
        height: size.BLOCK_HEIGHT * 12,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: size.BLOCK_WIDTH * 5,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                SizedBox(
                  width: size.BLOCK_WIDTH * 12,
                  height: size.BLOCK_WIDTH * 12,
                  child: Image.asset(
                    items[index]["image"] ?? "assets/images/coffee.png",
                    scale: 1,
                  ),
                ),
                Text(
                  items[index]["text"] ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: size.FONT_SIZE * 15,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
