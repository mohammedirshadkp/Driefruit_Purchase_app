import 'package:flutter/material.dart';
import 'package:driedfruits/main.dart';

class BlankFavoritePage extends StatelessWidget {
  const BlankFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("images/wishListEmpty.jpg"),
                width: deviceWidth * .8,
              ),
            ],
          ),
          Text(
            "Wishlist is empty!",
            style: TextStyle(fontSize: 22),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Wishlist Now"),
          ),
        ],
      ),
    );
  }
}
