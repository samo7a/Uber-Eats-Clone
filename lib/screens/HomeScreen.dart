import 'package:flutter/material.dart';
import 'package:uber/components/Categories.dart';
import 'package:uber/components/HeaderTabs.dart';
import 'package:uber/components/RestaurantItems.dart';
import 'package:uber/components/Searchbar.dart';
// import 'package:uber/util/Size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = "/homeScreenId";

  @override
  Widget build(BuildContext context) {
    // Size size = Size(context: context);
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
