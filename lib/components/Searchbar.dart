import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;
import 'package:uber/util/Size.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({Key? key}) : super(key: key);

  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  String location = "";
  List<dynamic> placeList = [];
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // controller.addListener(() {
    //   onChanged();
    // });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  onChanged() {
    getSuggestion(controller.text);
  }

  void getSuggestion(String input) async {
    String kPLACES_API_KEY = await dotenv.get("GOOGLE");
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String sessionToken = Random().nextInt(999999).toString();
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$sessionToken&language=en&country=us';
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      if (mounted && input != controller.text)
        setState(() {
          placeList = json.decode(response.body)['predictions'];
        });
    } else {
      print("error in getSuggestions");
      throw Exception('Failed to load predictions');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size(context: context);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(size.BLOCK_WIDTH * 3),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              onTap: () {
                controller.addListener(onChanged);
              },
              onChanged: (String value) {
                setState(() {
                  location = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(size.BLOCK_WIDTH * 7),
                ),
                fillColor: Colors.grey.withOpacity(0.2),
                filled: true,
                prefixIcon: Icon(
                  Icons.pin_drop,
                  color: Colors.black,
                ),
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: 10),
                  width: size.BLOCK_WIDTH * 23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.BLOCK_WIDTH * 10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.BLOCK_WIDTH * 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.timelapse,
                          color: Colors.black,
                          size: size.FONT_SIZE * 17,
                        ),
                        SizedBox(
                          width: size.BLOCK_WIDTH * 1,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Search",
              ),
              keyboardType: TextInputType.text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: placeList.length * size.BLOCK_HEIGHT * 5,
              child: ListView.separated(
                itemCount: placeList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 2,
                    indent: size.BLOCK_WIDTH * 5,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(left: size.BLOCK_WIDTH * 10),
                    padding: EdgeInsets.only(top: size.BLOCK_WIDTH * 3),
                    child: ListTile(
                      title: Text(
                        placeList[index]["description"],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: size.FONT_SIZE * 15,
                        ),
                      ),
                      onTap: () {
                        // controller.addListener(onChanged);
                        String value = placeList[index]["description"];
                        FocusScope.of(context).unfocus();
                        controller.removeListener(() {
                          setState(() {
                            placeList.clear();
                          });
                        });
                        setState(() {
                          location = value;
                          controller.text = value;
                          placeList.clear();
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
