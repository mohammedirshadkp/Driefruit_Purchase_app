import 'package:flutter/material.dart';

class Items {
  final String itemName, itemImage, category;
  final Color backgroundColor;
  final int itemId;
  Color cartedButtonColor;
  bool isCarted;
  bool isWishListed;
  double itemPrice;
  Items(
      {required this.itemName,
      required this.itemImage,
      required this.itemPrice,
      required this.category,
      required this.isWishListed,
      required this.backgroundColor,
      required this.itemId,
      required this.isCarted,
      required this.cartedButtonColor});
}
