import 'package:flutter/material.dart';

import '../Main Pages/itemPage.dart';
import '../main.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Map searchedItem = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: deviceHeight,
          width: deviceWidth,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: deviceWidth * 0.2,
                width: deviceWidth * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // color: Colors.yellow,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Search Here",
                  ),
                  onSubmitted: (value) {
                    // setState(() {
                    //   for (int i = 0; i < driedFruits.length; i++) {
                    //     if (driedFruits[i]["itemName"] == value) {
                    //       searchedItem = driedFruits[i];
                    //
                    //       break;
                    //     }
                    //   }
                    //   for (int i = 0; i < nutsList.length; i++) {
                    //     if (nutsList[i]["itemName"] == value) {
                    //       searchedItem = nutsList[i];
                    //
                    //       break;
                    //     }
                    //   }
                    // });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    itemBuilder: (context, index) => GestureDetector(
                      // onTap: () => Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ItemPage(
                      //         itemList: driedFruits,
                      //       ),
                      //     )),
                      child: Container(
                        width: deviceWidth,
                        height: deviceHeight * .1,
                        color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(image: AssetImage(searchedItem["itemImage"])),
                            Text(searchedItem["itemName"]),
                            Text(searchedItem["itemPrice"].toString()),
                          ],
                        ),
                      ),
                    ),
                    itemCount: 1,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
