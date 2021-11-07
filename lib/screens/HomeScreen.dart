import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uber/components/Categories.dart';
import 'package:uber/components/HeaderTabs.dart';
import 'package:uber/components/RestaurantItems.dart';
import 'package:uber/components/Searchbar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
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

  @override
  void initState() {
    super.initState();
    yelpApiKey = dotenv.get("YELP");
    restaurants = Provider.of<Restaurants>(context, listen: false);
    getRestaurantsFromYelp();
  }

  Future<void> getRestaurantsFromYelp() async {
    const String yelpUrl =
        "https://api.yelp.com/v3/businesses/search?term=restaurants&location=SanDiego";
    try {
      http.Response response = await http
          .get(Uri.parse(yelpUrl), headers: {"Authorization": "Bearer $yelpApiKey"});
      final data = jsonDecode(response.body);
      List array = data["businesses"];
      int length = array.length;
      for (int i = 0; i < length; i++) {
        String name = array[i]["name"];
        String image_url = array[i]["image_url"];
        double rating = array[i]["rating"];
        String price = array[i]["price"];
        int review_count = array[i]["review_count"];
        List categories = array[i]["categories"];
        List<String> myCategories = [];
        for (int j = 0; j < categories.length; j++) {
          myCategories.add(categories[j]["title"]);
        }
        restaurants.addRestaurant = Restaurant(
          name: name,
          image_url: image_url,
          rating: rating,
          review_count: review_count,
          price: price,
          categories: myCategories,
        );
      }
    } catch (e) {
      print(e);
    }
    print("end of getRestaurants");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
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
      ),
    );
  }
}
