import 'package:flutter/material.dart';
import 'package:uber/components/HeaderTabs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = "/homeScreenId";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeeeeee),
      child: SafeArea(
        child: Column(
          children: [
            HeaderTabs(),
          ],
        ),
      ),
    );
  }
}
