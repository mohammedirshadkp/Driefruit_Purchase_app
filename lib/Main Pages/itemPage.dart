import 'package:driedfruits/Main%20Pages/productDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Models/itemModels.dart';
import '../Models/wishListModel.dart';
import '../data.dart';
import '../main.dart';

class ItemPage extends StatefulWidget {
  final List<Items> itemList;
  const ItemPage({super.key, required this.itemList});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 30,
        ),
        SizedBox(
          width: deviceWidth,
          height: circleDiameter,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                child: CircleAvatar(
                  radius: circleRadius,
                  backgroundColor:
                      widget.itemList[selectedIndex].backgroundColor,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.itemList[selectedIndex].itemName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$${widget.itemList[selectedIndex].itemPrice}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          // unratedColor: Color.fromRGBO(234, 144, 108, 1),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemSize: deviceWidth / 25,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FloatingActionButton.extended(
                          elevation: 0,
                          backgroundColor: widget
                                  .itemList[selectedIndex].isCarted
                              ? widget.itemList[selectedIndex].cartedButtonColor
                              : Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsPage(
                                  itemList: widget.itemList,
                                  selectedItemIndex: selectedIndex,
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.shopping_cart_rounded,
                            color: Colors.black,
                          ),
                          label: widget.itemList[selectedIndex].isCarted
                              ? Text(
                                  "Already in cart",
                                  style: TextStyle(color: Colors.black),
                                )
                              : Text(
                                  "Add to cart",
                                  style: TextStyle(color: Colors.black),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                left: (deviceWidth / 2) - circleRadius,
              ),
              Positioned(
                top: circleRadius / 2,
                child: Image(
                  width: deviceWidth * 0.25,
                  image: AssetImage(widget.itemList[selectedIndex].itemImage),
                ),
              ),
              Positioned(
                right: (deviceWidth - circleDiameter) / 2.5,
                bottom: (circleRadius / 2) + (circleRadius / 2.7),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      int count = 0;
                      setState(() {
                        if (wishList.isEmpty) {
                          wishList.add(WishListItem(
                              itemName: widget.itemList[selectedIndex].itemName,
                              category: widget.itemList[selectedIndex].category,
                              itemImage:
                                  widget.itemList[selectedIndex].itemImage,
                              itemId: widget.itemList[selectedIndex].itemId,
                              itemPrice:
                                  widget.itemList[selectedIndex].itemPrice));
                          widget.itemList[selectedIndex].isWishListed = true;
                        } else {
                          for (int i = 0; i < wishList.length; i++) {
                            if (wishList[i].itemName ==
                                widget.itemList[selectedIndex].itemName) {
                              widget.itemList[selectedIndex].isWishListed =
                                  false;
                              wishList.removeAt(i);

                              count++;
                            }
                          }
                          if (count == 0) {
                            wishList.add(WishListItem(
                                itemName:
                                    widget.itemList[selectedIndex].itemName,
                                category:
                                    widget.itemList[selectedIndex].category,
                                itemImage:
                                    widget.itemList[selectedIndex].itemImage,
                                itemId: widget.itemList[selectedIndex].itemId,
                                itemPrice:
                                    widget.itemList[selectedIndex].itemPrice));
                            widget.itemList[selectedIndex].isWishListed = true;
                          }
                          print(wishList);
                        }
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: widget.itemList[selectedIndex].isWishListed
                          ? Colors.pink
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              height: 100,
              width: deviceWidth * 0.75,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey,
                            ),
                            Image(
                              width: 50,
                              image:
                                  AssetImage(widget.itemList[index].itemImage),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: widget.itemList.length,
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 28,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
        // bottomBar(),
      ],
    );
  }
}

Column categorySectionItem({required String imageName, required String text}) {
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: Image(
          image: AssetImage(imageName),
          fit: BoxFit.fill,
        ),
      ),
      Text(
        text,
        style: TextStyle(fontSize: 12, color: Colors.black),
      ),
    ],
  );
}
