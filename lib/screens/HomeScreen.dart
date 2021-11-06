import 'package:flutter/material.dart';
import 'package:uber/components/HeaderTabs.dart';
import 'package:uber/components/Searchbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = "/homeScreenId";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        body: SafeArea(
          child: Column(
            children: [
              HeaderTabs(),
              Searchbar(),
            ],
          ),
        ),
      ),
    );
  }
}
