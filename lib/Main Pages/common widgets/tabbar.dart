import 'package:flutter/material.dart';

import '../itemPage.dart';

class TabBarCommon extends StatelessWidget {
  const TabBarCommon({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(tabs: [
      categorySectionItem(
          imageName: "images/driedfruit.png", text: "Dried fruits"),
      categorySectionItem(
          imageName: "images/nuts-removebg-preview.png", text: "Nuts"),
      Icon(
        Icons.search,
        size: 50,
        color: Colors.black,
      ),
    ]);
  }
}
