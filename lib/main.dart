import 'package:flutter/material.dart';
import 'package:uber/models/Order.dart';
import 'package:uber/models/Restaurants.dart';
import 'package:uber/screens/HomeScreen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider<Order>(
          create: (context) => Order("Delivery"),
        ),
        ChangeNotifierProvider<Restaurants>(
          create: (context) => Restaurants([]),
        ),
      ],
      builder: (BuildContext context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: HomeScreen.id,
          routes: {
            HomeScreen.id: (context) => HomeScreen(),
          },
        );
      },
    );
  }
}
