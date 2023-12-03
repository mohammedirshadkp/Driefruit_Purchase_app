import 'package:flutter/material.dart';

import 'Models/cartItemModel.dart';
import 'Models/itemModels.dart';
import 'Models/wishListModel.dart';

List<CartItem> cartList = [];
List<WishListItem> wishList = [];

List<Items> driedFruitsList = [
  Items(
    itemName: "Dried  Apricots",
    itemImage: "images/driedfriutimage-removebg-preview.png",
    itemId: 101,
    itemPrice: 10.00,
    category: "dried",
    isWishListed: false,
    isCarted: false,
    cartedButtonColor: Color.fromRGBO(250, 240, 215, 1),
    backgroundColor: Color.fromRGBO(234, 144, 108, 1),
  ),
  Items(
      itemName: "Leave Dried fruits",
      itemId: 102,
      itemImage:
          "images/6138is2EQIL._AC_UF1000_1000_QL80_-removebg-preview.png",
      itemPrice: 11.00,
      category: "dried",
      isWishListed: false,
      isCarted: false,
      cartedButtonColor: Color.fromRGBO(221, 230, 237, 1),
      backgroundColor: Colors.grey),
];

List<Items> nutsList = [
  Items(
    itemName: "Cashew nuts",
    itemImage: "images/51r+ui8LoHL-removebg-preview.png",
    itemPrice: 100.00,
    category: "nuts",
    itemId: 201,
    isWishListed: false,
    isCarted: false,
    cartedButtonColor: Color.fromRGBO(160, 191, 224, 1),
    backgroundColor: Color.fromRGBO(120, 149, 203, 1),
  ),
  Items(
      itemName: "Peanuts",
      itemImage: "images/images-removebg-preview.png",
      itemPrice: 13.00,
      itemId: 202,
      category: "nuts",
      isWishListed: false,
      isCarted: false,
      cartedButtonColor: Color.fromRGBO(242, 102, 171, 1),
      backgroundColor: Color.fromRGBO(219, 0, 91, 1)),
];
