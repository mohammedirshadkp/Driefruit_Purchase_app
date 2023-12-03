import 'package:flutter/material.dart';

import '../Main Pages/productDetailsPage.dart';

import '../data.dart';
import '../main.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: deviceHeight * .1,
                    width: deviceWidth,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Cart",
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 390,
                    child: ListView.builder(
                      itemBuilder: (context, index) => Dismissible(
                        onDismissed: (direction) {
                          setState(() {
                            if (cartList[index].category == "dried") {
                              for (int i = 0; i < driedFruitsList.length; i++) {
                                if (cartList[index].itemId ==
                                    driedFruitsList[i].itemId) {
                                  driedFruitsList[i].isCarted = false;
                                  break;
                                }
                              }
                            } else {
                              for (int i = 0; i < nutsList.length; i++) {
                                if (cartList[index].itemId ==
                                    nutsList[i].itemId) {
                                  nutsList[i].isCarted = false;
                                }
                              }
                            }
                            cartList.removeAt(index);
                          });
                        },
                        key: UniqueKey(),
                        child: Container(
                          height: deviceHeight * .1,
                          width: deviceWidth,
                          color: Colors.black,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image:
                                        AssetImage(cartList[index].itemImage),
                                    width: deviceHeight * .06,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        cartList[index].itemName,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "\$${cartList[index].itemPrice}",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                "x${cartList[index].itemQuantity}",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      itemCount: cartList.length,
                    ),
                  ),
                  Container(
                    height: deviceHeight * .1,
                    width: deviceWidth,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${cartList.length} items",
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          height: deviceWidth * .10,
                          width: deviceWidth * 0.35,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: deviceWidth * .10,
                                width: (deviceWidth * 0.35) / 2,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color.fromRGBO(240, 192, 123, 1),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "\$${cartTotal}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                height: deviceWidth * .10,
                                width: (deviceWidth * 0.35) / 2,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(240, 192, 123, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(child: Text("Buy Now")),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
