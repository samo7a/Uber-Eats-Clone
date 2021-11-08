import 'package:flutter/material.dart';
import 'package:uber/models/OrderType.dart';
import 'package:uber/util/Size.dart';
import 'package:provider/provider.dart';

class HeaderTabs extends StatefulWidget {
  const HeaderTabs({Key? key}) : super(key: key);
  @override
  _HeaderTabsState createState() => _HeaderTabsState();
}

class _HeaderTabsState extends State<HeaderTabs> {
  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    return Container(
      padding: EdgeInsets.all(size.BLOCK_WIDTH),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderButton(
                text: "Delivery",
              ),
              HeaderButton(
                text: "Pickup",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderButton extends StatefulWidget {
  HeaderButton({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  State<HeaderButton> createState() => _HeaderButtonState();
}

class _HeaderButtonState extends State<HeaderButton> {
  late String text;
  @override
  void initState() {
    super.initState();
    text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    OrderType order = Provider.of<OrderType>(context, listen: false);
    return Container(
      child: Consumer<OrderType>(
        builder: (BuildContext context, value, Widget? child) {
          return ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                  value.activeTap == text ? Colors.black : Colors.white),
              foregroundColor: MaterialStateProperty.all(
                  value.activeTap == text ? Colors.white : Colors.black),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                  vertical: size.BLOCK_HEIGHT * 0.5,
                  horizontal: size.BLOCK_WIDTH * 5,
                ),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size.BLOCK_WIDTH * 10),
                ),
              ),
            ),
            onPressed: () => order.activeTap = text,
            child: Text(
              text,
              style: TextStyle(
                fontSize: size.FONT_SIZE * 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          );
        },
      ),
    );
  }
}
