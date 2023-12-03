import 'package:flutter/material.dart';

import '../HomePage/newHomePage.dart';
import '../data.dart';
import '../main.dart';


class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewHomePage(),
                      ));
                },
                icon: Icon(Icons.arrow_back_ios_sharp)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: deviceHeight * .8,
                width: deviceWidth,
                color: Colors.white,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: deviceWidth / 2.5,
                      width: deviceWidth / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(255, 250, 215, 1),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (wishList[index].category == "dried") {
                                        for (int j = 0;
                                            j < driedFruitsList.length;
                                            j++) {
                                          if (wishList[index].itemId ==
                                              driedFruitsList[j].itemId) {
                                            driedFruitsList[j].isWishListed =
                                                false;
                                            break;
                                          }
                                        }
                                      } else {
                                        if (wishList[index].category ==
                                            "nuts") {
                                          for (int j = 0;
                                              j < nutsList.length;
                                              j++) {
                                            if (wishList[index].itemId ==
                                                nutsList[j].itemId) {
                                              nutsList[j].isWishListed = false;
                                              break;
                                            }
                                          }
                                        }
                                      }
                                      wishList.removeAt(index);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                  )),
                            ],
                          ),
                          Image(
                            image: AssetImage(wishList[index].itemImage),
                            width: deviceWidth * .17,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(wishList[index].itemName),
                                  Text(wishList[index].itemPrice.toString())
                                ],
                              ),
                              Text("Add to cart"),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: wishList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
