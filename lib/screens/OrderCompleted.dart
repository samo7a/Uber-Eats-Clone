import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uber/components/RestaurantDetails/MenuItems.dart';
import 'package:uber/models/Cart.dart';
import 'package:lottie/lottie.dart';

class OrderCompleted extends StatelessWidget {
  const OrderCompleted({Key? key}) : super(key: key);
  static const id = "orderCompleted";
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/animations/check-mark.json',
                    repeat: false,
                  ),
                  Text(value.restName),
                  MenuItems(
                    foods: value.items,
                    showChecks: false,
                  ),
                  Lottie.asset('assets/animations/cooking.json'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
