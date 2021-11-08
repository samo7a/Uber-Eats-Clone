import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uber/components/home/Categories.dart';
import 'package:uber/components/home/HeaderTabs.dart';
import 'package:uber/components/home/RestaurantItems.dart';
import 'package:uber/components/home/Searchbar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:uber/models/OrderType.dart';
import 'package:uber/models/Restaurants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  static const String id = "/homeScreenId";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String yelpApiKey;
  late Restaurants restaurants;
  late OrderType order;

  @override
  void initState() {
    super.initState();
    yelpApiKey = dotenv.get("YELP");
    restaurants = Provider.of<Restaurants>(context, listen: false);
    order = Provider.of<OrderType>(context, listen: false);
    getRestaurantsFromYelp();
    order.addListener(() {
      restaurants.restaurants = [];
      getRestaurantsFromYelp();
    });
  }

  Future<void> getRestaurantsFromYelp() async {
    order = Provider.of<OrderType>(context, listen: false);
    String yelpUrl =
        "https://api.yelp.com/v3/businesses/search?term=restaurants&location=${order.location}";
    try {
      http.Response response = await http.get(Uri.parse(yelpUrl),
          headers: {"Authorization": "Bearer $yelpApiKey"});
      final data = jsonDecode(response.body);
      List array = data["businesses"];
      int length = array.length;
      for (int i = 0; i < length; i++) {
        List transactions = array[i]["transactions"] ?? [];
        String orderType = order.activeTap.toLowerCase();
        bool containsOrderType = false;
        for (int k = 0; k < transactions.length; k++) {
          if (transactions[k] == orderType) containsOrderType = true;
        }
        if (containsOrderType) {
          String name = array[i]["name"] ?? "";
          String image_url = array[i]["image_url"] ??
              "https://static.onecms.io/wp-content/uploads/sites/9/2020/04/24/ppp-why-wont-anyone-rescue-restaurants-FT-BLOG0420.jpg";
          double rating = array[i]["rating"] ?? 0.0;
          String price = array[i]["price"] ?? "\$";
          int review_count = array[i]["review_count"] ?? 0;
          List categories = array[i]["categories"] ?? [];
          List<String> myCategories = [];
          for (int j = 0; j < categories.length; j++) {
            myCategories.add(categories[j]["title"] ?? "");
          }
          restaurants.addRestaurant = Restaurant(
            index: i,
            name: name,
            image_url: image_url,
            rating: rating,
            review_count: review_count,
            price: price,
            categories: myCategories,
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Column(
          children: [
            HeaderTabs(),
            Searchbar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Categories(),
                    RestuarantItems(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
