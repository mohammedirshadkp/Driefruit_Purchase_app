import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../HomePage/newHomePage.dart';
import '../Models/cartItemModel.dart';
import '../Models/itemModels.dart';
import '../Models/wishListModel.dart';
import '../Secondary Pages/cartPage.dart';
import '../data.dart';
import '../main.dart';

double itemTotalPrice = 0;

class ProductDetailsPage extends StatefulWidget {
  final int selectedItemIndex;
  final List<Items> itemList;
  ProductDetailsPage(
      {required this.selectedItemIndex, required this.itemList}) {
    itemTotalPrice = itemList[selectedItemIndex].itemPrice;
  }

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

double cartTotal = 0;

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int itemQuantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => NewHomePage(),
                ));
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor:
            widget.itemList[widget.selectedItemIndex].backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              height: deviceHeight * 1.4,
              width: deviceWidth,
              color: widget.itemList[widget.selectedItemIndex].backgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: deviceWidth,
                      height: deviceHeight * .50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: deviceWidth,
                            height: deviceHeight * 0.25,
                            color: widget.itemList[widget.selectedItemIndex]
                                .backgroundColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                    widget.itemList[widget.selectedItemIndex]
                                        .itemImage,
                                  ),
                                  width: deviceWidth * .32,
                                ),
                                Image(
                                  image: AssetImage(
                                    widget.itemList[widget.selectedItemIndex]
                                        .itemImage,
                                  ),
                                  width: deviceWidth * .32,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            widget.itemList[widget.selectedItemIndex].itemName,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "100% pure quality",
                                style: TextStyle(color: Colors.white),
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                // unratedColor: Color.fromRGBO(234, 144, 108, 1),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemSize: deviceWidth / 25,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.white,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                          Text(
                            "Capacity",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          Row(
                            children: [
                              capacityContainer(
                                text: "Calories",
                                value: "90",
                                backgroundColor: widget
                                    .itemList[widget.selectedItemIndex]
                                    .backgroundColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              capacityContainer(
                                text: "Additive",
                                value: "3%",
                                backgroundColor: widget
                                    .itemList[widget.selectedItemIndex]
                                    .backgroundColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              capacityContainer(
                                text: "Vitamin",
                                value: "8%",
                                backgroundColor: widget
                                    .itemList[widget.selectedItemIndex]
                                    .backgroundColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: deviceHeight * .75,
              child: Container(
                height: deviceHeight,
                width: deviceWidth,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: deviceHeight / 1.92,
              child: Container(
                width: deviceWidth,
                height: deviceHeight * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Quantity(300g)",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      itemQuantity--;
                                      itemTotalPrice -= widget
                                          .itemList[widget.selectedItemIndex]
                                          .itemPrice;
                                      print(itemQuantity);

                                      if (itemQuantity <= 1) {
                                        itemQuantity = 1;
                                        itemTotalPrice = widget
                                            .itemList[widget.selectedItemIndex]
                                            .itemPrice;
                                      }
                                    });
                                  },
                                  icon: Icon(Icons.arrow_back_ios_sharp),
                                ),
                                Text(
                                  itemQuantity.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      itemQuantity++;
                                      itemTotalPrice = widget
                                              .itemList[
                                                  widget.selectedItemIndex]
                                              .itemPrice *
                                          itemQuantity;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_forward_ios_sharp),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "\$${itemTotalPrice}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FloatingActionButton.extended(
                            onPressed: () {
                              int count = 0;
                              int itemAdded = 0;
                              setState(() {
                                if (cartList.isEmpty) {
                                  cartList.add(CartItem(
                                    itemName: widget
                                        .itemList[widget.selectedItemIndex]
                                        .itemName,
                                    itemImage: widget
                                        .itemList[widget.selectedItemIndex]
                                        .itemImage,
                                    itemPrice: widget
                                        .itemList[widget.selectedItemIndex]
                                        .itemPrice,
                                    itemTotalPrice: itemTotalPrice,
                                    itemId: widget
                                        .itemList[widget.selectedItemIndex]
                                        .itemId,
                                    itemQuantity: itemQuantity,
                                    category: widget
                                        .itemList[widget.selectedItemIndex]
                                        .category,
                                  ));
                                  widget.itemList[widget.selectedItemIndex]
                                      .isCarted = true;
                                  itemAdded++;
                                } else {
                                  for (int i = 0; i < cartList.length; i++) {
                                    if (cartList[i].itemName ==
                                        widget
                                            .itemList[widget.selectedItemIndex]
                                            .itemName) {
                                      count++;
                                    }
                                  }
                                  if (count == 0) {
                                    cartList.add(CartItem(
                                        itemName: widget
                                            .itemList[widget.selectedItemIndex]
                                            .itemName,
                                        itemImage: widget
                                            .itemList[widget.selectedItemIndex]
                                            .itemImage,
                                        itemPrice: widget
                                            .itemList[widget.selectedItemIndex]
                                            .itemPrice,
                                        itemTotalPrice: itemTotalPrice,
                                        itemId: widget
                                            .itemList[widget.selectedItemIndex]
                                            .itemId,
                                        itemQuantity: itemQuantity,
                                        category: widget
                                            .itemList[widget.selectedItemIndex]
                                            .category));
                                    widget.itemList[widget.selectedItemIndex]
                                        .isCarted = true;
                                    itemAdded++;
                                  } else {
                                    final snackBar = SnackBar(
                                      content: const Text(
                                        'Item Already In Cart',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      backgroundColor: (Colors.white70),
                                      action: SnackBarAction(
                                          label: "OK", onPressed: () {}),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                }
                                if (itemAdded != 0) {
                                  cartTotal = 0;
                                  for (int i = 0; i < cartList.length; i++) {
                                    cartTotal += cartList[i].itemPrice *
                                        cartList[i].itemQuantity;
                                  }
                                }
                              });
                            },
                            label: widget
                                    .itemList[widget.selectedItemIndex].isCarted
                                ? Text("Already in cart")
                                : Text("Add to cart"),
                            elevation: 0,
                            backgroundColor: widget
                                    .itemList[widget.selectedItemIndex].isCarted
                                ? Colors.grey
                                : widget.itemList[widget.selectedItemIndex]
                                    .backgroundColor,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  int count = 0;
                                  if (wishList.isEmpty) {
                                    wishList.add(WishListItem(
                                        itemName: widget
                                            .itemList[widget.selectedItemIndex]
                                            .itemName,
                                        category: widget
                                            .itemList[widget.selectedItemIndex]
                                            .category,
                                        itemImage: widget
                                            .itemList[widget.selectedItemIndex]
                                            .itemImage,
                                        itemId: widget
                                            .itemList[widget.selectedItemIndex]
                                            .itemId,
                                        itemPrice: widget
                                            .itemList[widget.selectedItemIndex]
                                            .itemPrice));
                                    widget.itemList[widget.selectedItemIndex]
                                        .isWishListed = true;
                                  } else {
                                    for (int i = 0; i < wishList.length; i++) {
                                      if (wishList[i].itemName ==
                                          widget
                                              .itemList[
                                                  widget.selectedItemIndex]
                                              .itemName) {
                                        widget
                                            .itemList[widget.selectedItemIndex]
                                            .isWishListed = false;
                                        wishList.removeAt(i);

                                        count++;
                                      }
                                    }
                                    if (count == 0) {
                                      wishList.add(WishListItem(
                                          itemName: widget
                                              .itemList[
                                                  widget.selectedItemIndex]
                                              .itemName,
                                          category: widget
                                              .itemList[
                                                  widget.selectedItemIndex]
                                              .category,
                                          itemImage: widget
                                              .itemList[
                                                  widget.selectedItemIndex]
                                              .itemImage,
                                          itemId: widget
                                              .itemList[
                                                  widget.selectedItemIndex]
                                              .itemId,
                                          itemPrice: widget
                                              .itemList[
                                                  widget.selectedItemIndex]
                                              .itemPrice));
                                      widget.itemList[widget.selectedItemIndex]
                                          .isWishListed = true;
                                    }
                                    print(wishList);
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: widget.itemList[widget.selectedItemIndex]
                                            .isWishListed ==
                                        true
                                    ? Colors.pink
                                    : Colors.grey,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: deviceHeight * .78,
              child: Container(
                color: Colors.black,
                height: deviceHeight,
                width: deviceWidth,
                child: CartPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container capacityContainer(
    {required String text,
    required String value,
    required Color backgroundColor}) {
  return Container(
    width: deviceWidth * .20,
    height: deviceWidth * .20,
    decoration: BoxDecoration(
      color: backgroundColor,
      border: Border.all(color: Colors.white),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        Text(
          value,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
