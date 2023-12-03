import 'package:flutter/material.dart';
import 'package:driedfruits/Secondary%20Pages/blankCart.dart';
import 'package:driedfruits/Secondary%20Pages/favoritepage.dart';
import 'package:driedfruits/Secondary%20Pages/searchPage.dart';
import 'package:driedfruits/data.dart';
import 'package:driedfruits/main.dart';
import '../Main Pages/common widgets/tabbar.dart';
import '../Main Pages/itemPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Secondary Pages/blankFavoritePage.dart';
import '../Secondary Pages/cartPage.dart';

class NewHomePage extends StatefulWidget {
  final String? userEmail;

  const NewHomePage({super.key, this.userEmail});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              if (wishList.isEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlankFavoritePage(),
                    ));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoritePage(),
                    ));
              }
            },
            icon: Icon(Icons.favorite_border_outlined),
          ),
          IconButton(
            onPressed: () {
              if (cartList.isEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlankCart(),
                    ));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ));
              }
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const ListTile(
              leading: Icon(FontAwesomeIcons.user),
              // title: Text(widget.userEmail!),
            ),
            GestureDetector(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log out"),
              ),
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        animationDuration: const Duration(seconds: 0),
        length: 3,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: deviceHeight * .10,
                width: deviceWidth,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "HI Irshad",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "What's Today's taste?😊",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              const TabBarCommon(),
              SizedBox(
                height: deviceHeight * .65,
                width: deviceWidth,
                child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ItemPage(
                        itemList: driedFruitsList,
                      ),
                      ItemPage(
                        itemList: nutsList,
                      ),
                      const SearchPage(),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
