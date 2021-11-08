import 'package:flutter/material.dart';
import 'package:uber/Tabs.dart';
import 'package:uber/models/OrderType.dart';
import 'package:uber/models/Restaurants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:uber/screens/RestaurantDetails.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OrderType>(
          create: (context) => OrderType("Delivery", "US"),
        ),
        ChangeNotifierProvider<Restaurants>(
          create: (context) => Restaurants([]),
        ),
      ],
      builder: (BuildContext context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: Tabs.id,
          routes: {
            Tabs.id: (context) => Tabs(),
            RestaurantDetails.id: (context) => RestaurantDetails(),
          },
        );
      },
    );
  }
}
