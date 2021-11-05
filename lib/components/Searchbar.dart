import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({ Key? key }) : super(key: key);

  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("search bar"),
    );
  }
}