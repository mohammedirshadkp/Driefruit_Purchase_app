import 'package:flutter/material.dart';

class CartItem {
  final String itemName, itemImage;
  final double itemTotalPrice, itemPrice;
  final int itemId;
  final int itemQuantity;
  final String category;
  CartItem(
      {required this.itemName,
      required this.itemImage,
      required this.itemPrice,
      required this.itemTotalPrice,
      required this.itemQuantity,
      required this.itemId,
      required this.category});
}
