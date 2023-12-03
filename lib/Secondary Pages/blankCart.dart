import 'package:flutter/material.dart';

class BlankCart extends StatelessWidget {
  const BlankCart({super.key});

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
          Column(
            children: [
              Image(
                image: AssetImage("images/cartemptyimage.png"),
              ),
              Text(
                "Your cart is empty!",
                style: TextStyle(fontSize: 25.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Continue Shopping",
                    style: TextStyle(color: Colors.blue, fontSize: 20.0),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
