import 'package:flutter/material.dart';

import '../data/menu_item_data.dart';

class MenuItemPage extends StatelessWidget {
  final MenuItemData itemData;

  const MenuItemPage(this.itemData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset("assets/images/${itemData.imageName}"),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              itemData.title,
              style: const TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20.0),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              itemData.description,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
              ),
            ),
          )),
          const SizedBox(height: 40.0),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Text(
              "${itemData.price} F",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
            ),
            onPressed: () {},
            child: const SizedBox(
              child: Text(
                "Ajouter au panier",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
