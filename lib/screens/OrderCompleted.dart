import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uber/Tabs.dart';
import 'package:uber/components/RestaurantDetails/MenuItems.dart';
import 'package:uber/models/Cart.dart';
import 'package:lottie/lottie.dart';
import 'package:uber/util/Size.dart';

class OrderCompleted extends StatefulWidget {
  const OrderCompleted({Key? key}) : super(key: key);
  static const id = "orderCompleted";

  @override
  State<OrderCompleted> createState() => _OrderCompletedState();
}

class _OrderCompletedState extends State<OrderCompleted> {
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
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
                    width: size.BLOCK_WIDTH * 20,
                    height: size.BLOCK_WIDTH * 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      size.BLOCK_WIDTH * 2,
                    ),
                    child: Text(
                      "Your Order at ${value.restName} has been placed for ${value.totalPrice.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: size.FONT_SIZE * 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  MenuItems(
                    foods: value.items,
                    showChecks: false,
                  ),
                  Lottie.asset(
                    'assets/animations/cooking.json',
                    width: size.BLOCK_WIDTH * 50,
                    height: size.BLOCK_WIDTH * 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      value.resetCart();
                      Navigator.pushNamedAndRemoveUntil(
                          context, Tabs.id, (route) => false);
                    },
                    child: Text("Go Back to Home"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
