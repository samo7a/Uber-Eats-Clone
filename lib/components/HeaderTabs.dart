import 'package:flutter/material.dart';

class HeaderTabs extends StatefulWidget {
  const HeaderTabs({Key? key}) : super(key: key);

  @override
  _HeaderTabsState createState() => _HeaderTabsState();
}

class _HeaderTabsState extends State<HeaderTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("header tabs"),
    );
  }
}
